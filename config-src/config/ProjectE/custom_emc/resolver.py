import tqdm

from ruamel.yaml import YAML
from typing import Any

class UpdateListener():
    def __init__(self):
        self.isUpdating = False
    
    def update(self):
        if (not self.isUpdating):
            self.isUpdating = True
            # do stuff here and then...
            self.isUpdating = False

class IngredientBase():
    def __init__(self):
        self.bep:str = ""
        self.hasValue:bool = False
        self.value:int = -1
        
        self.listeners:list[UpdateListener] = []
    
    def addListener(self, listener:UpdateListener):
        if (listener not in self.listeners):
            self.listeners.append(listener)
    
    def setValue(self, newValue:int):
        if (self.hasValue):
            if (newValue != self.value):
                # TODO: Write a better descriptive case for this
                raise ValueError()
        else:
            self.value = newValue
            self.hasValue = True
            
            for listener in self.listeners:
                listener.update()

class Item(IngredientBase, UpdateListener):
    def __init__(self):
        IngredientBase.__init__(self)
        UpdateListener.__init__(self)
        
    def update(self):
        if (not self.isUpdating):
            self.isUpdating = True
            
            for listener in self.listeners:
                listener.update()
            
            self.isUpdating = False

class Tag(IngredientBase, UpdateListener):
    def __init__(self):
        IngredientBase.__init__(self)
        UpdateListener.__init__(self)
        
        self.items:list[Item] = []
        
    def addItem(self, item:Item):
        if (item not in self.items):
            self.items.append(item)
            self.addListener(item)
            item.addListener(self)

    def update(self):
        if (not self.isUpdating):
            self.isUpdating = True
            
            # we've been told to update, so check for the new value
            for item in self.items:
                if (item.value != self.value):
                    self.setValue(item.value)
            
            for listener in self.listeners:
                listener.update()
            
            self.isUpdating = False

    def setValue(self, newValue:int):
        if (self.hasValue):
            if (newValue != self.value):
                # TODO: Write a better descriptive case for this
                raise ValueError()
        else:
            self.value = newValue
            self.hasValue = True
            
            for item in self.items:
                item.setValue(newValue)
            
            for listener in self.listeners:
                listener.update()

class Ingredient():
    def __init__(self):
        self.source:IngredientBase = IngredientBase()
        self.count:int = 0
        
class IngredientChoice(Ingredient, UpdateListener):
    def __init__(self):
        Ingredient.__init__(self)
        UpdateListener.__init__(self)

        self.sources:list[IngredientBase] = []
        
    def addIngredient(self, ingredient:IngredientBase):
        self.sources.append(ingredient)
        ingredient.addListener(self)
    
    def setValue(self, newValue:int):
        self.source.setValue(newValue) # conveinience thing, really
        for entry in self.sources:
            entry.setValue(newValue)
    
    def update(self):
        if (not self.isUpdating):
            self.isUpdating = True
            
            for entry in self.sources:
                if (entry.value != self.source.value):
                    self.setValue(entry.value)
            
            self.isUpdating = False

class Recipe(UpdateListener):
    def __init__(self):
        UpdateListener.__init__(self)
        
        self.inputs:list[Ingredient] = []
        self.output:Ingredient = Ingredient()
        self.resolved:bool = False
    
    def hasIngredient(self, bep:str) -> bool:
        ret:bool = False
        
        for ingredient in self.inputs:
            if (ingredient.source.bep == bep):
                ret = True
        
        return ret
    
    def getIngredient(self, bep:str) -> Ingredient:
        ret:Ingredient = Ingredient()
        
        for ingredient in self.inputs:
            if (ingredient.source.bep == bep):
                ret = ingredient
        
        return ret
    
    def getOrCreateIngredient(self, bep:str, source:IngredientBase) -> Ingredient:
        if not self.hasIngredient(bep):
            ingredientSwp:Ingredient = Ingredient()
            ingredientSwp.source = source
            ingredientSwp.count = 0
            source.addListener(self)
            self.inputs.append(ingredientSwp)
    
        return self.getIngredient(bep)
    
    def isResolvable(self) -> bool:
        ret:bool = False
        
        # TODO: Add reverse resolution
        ret = self.isResolvableForwards()
        
        return ret
    
    def isResolvableForwards(self) -> bool:
        ret:bool = True
        
        for inItem in self.inputs:
            if (not inItem.source.hasValue):
                ret = False
        
        return ret
    
    def isResolvableBackwards(self) -> bool:
        # TODO: Write a reverse resolver function
        return False

    def update(self):
        if (not self.isUpdating):
            self.isUpdating = True
            
            if (self.isResolvableForwards()):
                # we just total up inputs...
                totalEMC = 0
                
                for item in self.inputs:
                    totalEMC = totalEMC + (item.source.value * item.count)
                
                # make sure we can set the value cleanly
                fVal:float = float(totalEMC) / float(self.output.count)
                if (float(int(fVal)) == fVal):
                    self.output.source.setValue(int(fVal))
                else:
                    raise ArithmeticError(f"Can't neatly divide EMC! {totalEMC} / {self.output.count}")
            
            self.isUpdating = False

class Resolver():
    def __init__(self):
        self.items:dict[str, Item] = {}
        self.tags:dict[str, Tag] = {}
        self.recipes:list[Recipe] = []
        self.recipeDict:Any = None
        self.configDict:Any = None
    
    def getOrCreateItem(self, bep:str) -> Item:
        if (bep not in self.items):
            itemSwp:Item = Item()
            itemSwp.bep = bep
            self.items[itemSwp.bep] = itemSwp
        
        return self.items[bep]
    
    def getOrCreateTag(self, bep:str) -> Tag:
        if (bep not in self.tags):
            tagSwp:Tag = Tag()
            tagSwp.bep = bep
            self.tags[tagSwp.bep] = tagSwp
        
        return self.tags[bep]
    
    def graph(self) -> str:
        ret:str = ""
        
        # start a digraph
        # using strict to lazily allow duplicate references
        ret = ret + "strict digraph {\n"
        
        for item in list(self.items.values()):
            ref:str  = "i_" + str(id(item))
            line:str = ref + "[label=\"" + item.bep + "\"]"
            ret = ret + line + "\n"
        
        for tag in list(self.tags.values()):
            ref:str = "i_" + str(id(tag))
            line:str = ref +  "[label=\"" + tag.bep + "\"]"
            ret = ret + line + "\n"
        
        for recipe in self.recipes:
            for ingredient in recipe.inputs:
                istr:str = "i_" + str(id(ingredient.source))
                pstr:str = "i_" + str(id(recipe.output.source))
                line:str = istr + " -> " + pstr
                ret = ret + line + "\n"
        
        # end digraph
        ret = ret + "}"
        
        return ret
    
    def loadConfig(self, fpath):
        with open(fpath) as configSrc:
            yaml=YAML()
            self.configDict = yaml.load(configSrc)
    
    def loadRecipes(self, fpath):
        with open(fpath) as recipeSrc:
            yaml=YAML()
            self.recipeDict = yaml.load(recipeSrc)

    def parseRecipeDict(self):
        for rawRecipe in tqdm.tqdm(self.recipeDict["recipes"]):
            # we need empty recipe
            recipe:Recipe = Recipe()
            
            # make sure we actually have a recipe, what the-!?!?
            if ((rawRecipe["ingredients"] != None) and (rawRecipe["output"]["name"] != "minecraft:air")):
                # okay. We can handle the inputs first.

                for rawIngredient in rawRecipe["ingredients"]:
                    # we have to build the structure for it - or at least make sure
                    # it exists - and then wire it up with an ingredient into the
                    # recipe. Also if it's already in the recipe we increase the
                    # counter.
                    if (rawIngredient["bep"] == "<item:minecraft:air>"):
                        # air is used as a filler in shaped recipes
                        # it can be safely ignored for our needs
                        pass
                    elif ("|" in rawIngredient["bep"]):
                        # options
                        optionsSwp:IngredientChoice = IngredientChoice()
                        optionsSwp.source.bep = rawIngredient["bep"]
                        
                        # check to see if this one exists in recipe
                        if recipe.hasIngredient(optionsSwp.source.bep):
                            # get and add one to quantity
                            swp:Ingredient = recipe.getIngredient(optionsSwp.source.bep)
                            swp.count = swp.count + 1
                        else:
                            rawIngredientList = rawIngredient["bep"].split(" | ")
                            
                            # much of this process is echoed down below, if you need
                            # it explained
                            for ingredient in rawIngredientList:
                                if (ingredient[1:4] == "tag"):
                                    tagSwp:Tag = self.getOrCreateTag(ingredient)
                                    # we don't add the items to the tag here
                                    # because we have no clue if they're
                                    # even for a single tag or not
                                    optionsSwp.addIngredient(tagSwp)
                                else:
                                    optionsSwp.addIngredient(self.getOrCreateItem(ingredient))

                    elif (rawIngredient["bep"][1:4] == "tag"):
                        # tag
                        
                        # make sure tag exists first
                        tagSwp:Tag = self.getOrCreateTag(rawIngredient["bep"])
                        
                        # Now the items that go into it
                        for item in rawIngredient["items"]:
                            # rebuild the BEP string and add the item
                            itemBep:str = "<item:" + item + ">"
                            tagSwp.addItem(self.getOrCreateItem(itemBep))
                                
                        # tag now definitely exists, so...
                        # grab ingredient in recipe and increase count
                        ingredientSwp:Ingredient = recipe.getOrCreateIngredient(rawIngredient["bep"], self.tags[rawIngredient["bep"]])
                        ingredientSwp.count = ingredientSwp.count + 1
                    else:
                        # item
                        
                        # make sure item exists and retrieve it
                        itemSwp:Item = self.getOrCreateItem(rawIngredient["bep"])

                        # item now exists so... get ingredient and increase count
                        ingredientSwp:Ingredient = recipe.getOrCreateIngredient(rawIngredient["bep"], itemSwp)
                        ingredientSwp.count = ingredientSwp.count + 1
                
                # that should do it. Now add the output
                outputBep:str = "<item:" + rawRecipe["output"]["name"] + ">"
                
                itemSwp = self.getOrCreateItem(outputBep)
                    
                recipe.output.source = self.items[outputBep]
                recipe.output.count = rawRecipe["output"]["count"]
                
                # append recipe to list
                self.recipes.append(recipe)
                
    def writeGraph(self, fpath):
        with open(fpath, "w") as graphFile:
            graphFile.write(self.graph())

def main():
    resolver:Resolver = Resolver()
    
    print("Loading recipe YAML")
    resolver.loadRecipes("recipes.YAML")
    print("Recipe YAML loaded")
    
    print("Loading config YAML")
    resolver.loadConfig("config.yaml")
    print("Loaded config yaml!")
    
    print("Parsing recipe structure")
    resolver.parseRecipeDict()
    
    # TODO: Add config recipes
    
    # TODO: Propagate config values
    
    # TODO: Apply late config values
    
    
if (__name__ == "__main__"):
    main()