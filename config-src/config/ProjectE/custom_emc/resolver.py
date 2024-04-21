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
        self.consumed:bool = True
        
        self.listeners:list[UpdateListener] = []
    
    def addListener(self, listener:UpdateListener):
        if (listener not in self.listeners):
            self.listeners.append(listener)
    
    def setValue(self, newValue:int):
        print(f"{self.bep} told setvalue of {newValue}")
        if (self.hasValue):
            if (newValue != self.value):
                # TODO: Resolve this experiment, and adjust accordingly
                print(f"Have value of {self.value}")
                if (self.value < newValue):
                    self.value = self.value
                else:
                    self.value = newValue
                print(f"Set value to {self.value}")
        else:
            self.value = newValue
            self.hasValue = True
            print(f"set value to {newValue}")
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
            # self.addListener(item)
            item.addListener(self)

    def update(self):
        if (not self.isUpdating):
            self.isUpdating = True
            
            # we've been told to update, so check for the new value
            for item in self.items:
                if (item.hasValue):
                    if (item.value < self.value):
                        self.setValue(item.value)
            
            for listener in self.listeners:
                listener.update()
            
            self.isUpdating = False

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
        
        # late override - make sure it's not a clone
        ret = ret and self.isResolvableNonClone()
        
        return ret
    
    def isResolvableNonClone(self) -> bool:
        ret:bool = True
        
        if (len(self.inputs) == 1):
            if (self.inputs[0].source.bep == self.output.source.bep):
                ret = False
        
        return ret
    
    def isResolvableForwards(self) -> bool:
        ret:bool = True
        
        for inItem in self.inputs:
            if ((not inItem.source.hasValue) and (inItem.source.consumed)):
                ret = False
        
        # second pass, check for zeroes
        for inItem in self.inputs:
            if (inItem.source.hasValue):
                if ((inItem.source.value == 0) and (inItem.source.consumed)):
                    ret = True
        
        return ret
    
    def isResolvableBackwards(self) -> bool:
        ret:bool = True
        
        # three major conditions for reverse resolution
        
        # one, must have output with a value
        if (not self.output.source.hasValue):
            ret = False

        # two, must have exactly one input without a value
        unValuedInputs:int = 0
        for inItem in self.inputs:
            if ((not inItem.source.hasValue) and (inItem.source.consumed)):
                unValuedInputs = unValuedInputs + 1
        if (unValuedInputs != 1):
            ret = False
        
        # three, the output must not be worth zero
        if (self.output.source.value == 0):
            ret = False
        
        return ret

    def resolveBackwards(self) -> None:
        if (self.isResolvableBackwards()):
            # okay, total up the outputs
            totalEMC:int = 0
            totalEMC = self.output.count * self.output.source.value
            
            # total up the inputs
            accountedEMC:int = 0
            for inItem in self.inputs:
                if ((inItem.source.hasValue) and (inItem.source.consumed)):
                    accountedEMC = accountedEMC + (inItem.count * inItem.source.value)
                    
            # find the ingredient without EMC
            unAccountedItem:Ingredient = Ingredient()
            for inItem in self.inputs:
                if ((not inItem.source.hasValue) and (inItem.source.consumed)):
                    unAccountedItem = inItem
            
            # unaccounted for emc
            unAccountedEMC = totalEMC - accountedEMC
            
            # make sure we got a positive number that last step
            sane:bool = True
            if (unAccountedEMC < 1):
                sane = False
            
            # try division, if it fails we can see what happens by raising it
            if (sane):
                fVal:float = float(unAccountedEMC) / float(unAccountedItem.count)
                if (float(int(fVal)) == fVal):
                    unAccountedItem.source.setValue(int(fVal))
                else:
                    raise ArithmeticError(f"Can't neatly divide EMC! {unAccountedEMC} / {unAccountedItem.count} (reversed resolution)")

    def resolveForwards(self) -> None:
        if (self.isResolvableForwards()):
            # we just total up inputs...
            totalEMC:int = 0
            
            for item in self.inputs:
                if item.source.consumed:
                    totalEMC = totalEMC + (item.source.value * item.count)
            
            # second pass, check for zero
            for item in self.inputs:
                if ((item.source.value == 0) and (item.source.consumed)):
                    totalEMC = 0
            
            # make sure we can set the value cleanly
            fVal:float = float(totalEMC) / float(self.output.count)
            if (float(int(fVal)) == fVal):
                self.output.source.setValue(int(fVal))
            else:
                raise ArithmeticError(f"Can't neatly divide EMC! {totalEMC} / {self.output.count}")

    def update(self):
        if (not self.isUpdating):
            self.isUpdating = True
            self.resolveForwards()
            self.resolveBackwards()
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

    def parseConfigDict(self):
        # TODO: Parse config recipes
        for item in self.configDict["unconsumedItems"]:
            self.getOrCreateItem(item).consumed = False

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
    
    def applyNormalConfigValues(self):
        for entry in self.configDict["values"]["normal"]["base"]:
            val = entry["value"] * self.configDict["values"]["basemult"]
            
            if ("<item:" in entry["bep"]):
                # item
                self.getOrCreateItem(entry["bep"]).setValue(val)
            else:
                # tag
                self.getOrCreateTag(entry["bep"]).setValue(val)
                
        for entry in self.configDict["values"]["normal"]["derived"]:
            # get value together
            val = 0
            if ("<item:" in entry["from"]):
                val = self.getOrCreateItem(entry["from"]).value
            else:
                val = self.getOrCreateTag(entry["from"]).value
            
            if (entry["type"] == "division"):
                swp = float(val)
                swp = swp / entry["value"]
                
                if (float(int(swp)) == swp):
                    val = int(swp)
                else:
                    raise ArithmeticError(f"Can't neatly divide EMC! {swp} / {entry['value']} (derived value)")
            else:
                #TODO: Implement other derivation methods
                raise NotImplementedError(entry["type"])
            
            # Value finally together, set it
            if ("<item:" in entry["bep"]):
                # item
                self.getOrCreateItem(entry["bep"]).setValue(val)
            else:
                # tag
                self.getOrCreateTag(entry["bep"]).setValue(val)
                
        for entry in self.configDict["values"]["normal"]["equivalent"]:
            refObject:IngredientBase = IngredientBase()
            
            if ("<item:" in entry["bep"]):
                # refobject is an item
                refObject = self.getOrCreateItem(entry["bep"])
            else:
                # refobject is a tag
                refObject = self.getOrCreateTag(entry["bep"])
                
            if (not refObject.hasValue):
                raise ValueError(f"Tried to copy unvalued item! : {refObject.bep}")
            
            for child in entry["children"]:
                if ("<item:" in child):
                    # child is an item
                    self.getOrCreateItem(child).setValue(refObject.value)
                else:
                    # child is a tag
                    self.getOrCreateTag(child).setValue(refObject.value)
    
    def writeGraph(self, fpath):
        with open(fpath, "w") as graphFile:
            graphFile.write(self.graph())

    def status(self):
        print("")
        print("---------------------------------------------------------------")
        print("                       Status")
        print("---------------------------------------------------------------")
        print(f"{str(len(self.items)).zfill(10)} total items")
        
        unvaluedCount:int = 0
        for item in self.items.values():
            if (not item.hasValue):
                unvaluedCount = unvaluedCount + 1
        
        print(f"{str(unvaluedCount).zfill(10)} items still unvalued")
        
        mostWanted:IngredientBase = IngredientBase()
        for item in self.items.values():
            if (len(item.listeners) > len(mostWanted.listeners)):
                if (not item.hasValue):
                    mostWanted = item
        
        print("")
        print("most wanted item:")
        print(f"{mostWanted.bep}")

        print("---------------------------------------------------------------")
        print("")

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
    print("done")
    
    print("parsing config dict")
    resolver.parseConfigDict()
    print("done")
    
    print("Applying and propagating normal config values")
    resolver.applyNormalConfigValues()
    print("normal values done!")
    
    # TODO: Apply late config values
    
    resolver.status()
    
if (__name__ == "__main__"):
    main()