class UpdateListener():
    def update(self):
        pass

class IngredientBase():
    def __init__(self):
        self.bep:str = ""
        self.hasValue:bool = False
        self.value:int = -1
        self.updatedRecently = False
        
        listeners:list[UpdateListener] = []

class Item(IngredientBase):
    def __init__(self):
        super().__init__()

class Tag(IngredientBase):
    def __init__(self):
        super().__init__()
        
        self.items:list[Item] = []

class Ingredient():
    def __init__(self):
        self.source:IngredientBase = IngredientBase()
        self.count:int = 0

class Recipe(UpdateListener):
    def __init__(self):
        self.inputs:list[Ingredient] = []
        self.outputs:list[Ingredient] = []
        self.resolved:bool = False
    
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
                
        # TODO: Provide resolution when values are partially resolved
        if (len(self.outputs) > 1):
            ret = False
        
        return ret
    
    def isResolvableBackwards(self) -> bool:
        # TODO: Write a reverse resolver function
        return False
    
def graph(items:list[Item], tags:list[Tag], recipes:list[Recipe]) -> str:
    ret:str = ""
    
    # start a digraph
    # using strict to lazily allow duplicate references
    ret = ret + "strict digraph {\n"
    
    for item in items:
        ref:str  = "i_" + str(id(item))
        line:str = ref + "[label[\"" + item.bep + "\"]"
        ret = ret + line + "\n"
    
    for tag in tags:
        ref:str = "i_" + str(id(tag))
        line:str = ref +  "[label[\"" + tag.bep + "\"]"
        ret = ret + line + "\n"
    
    for recipe in recipes:
        for ingredient in recipe.inputs:
            for product in recipe.outputs:
                istr:str = "i_" + str(id(ingredient.source))
                pstr:str = "i_" + str(id(product.source))
                line:str = istr + " -> " + pstr
                ret = ret + line + "\n"
    
    # end digraph
    ret = ret + "}"
    
    return ret


def main():
    items:dict[str, Item] = {}
    tags:dict[str, Tag] = {}
    recipes:list[Recipe] = []
    
    