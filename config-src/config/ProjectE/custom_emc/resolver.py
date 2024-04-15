class Item():
    def __init__(self):
        self.bep:str = ""
        self.hasValue:bool = False
        self.value:int = -1
        self.count:int = 0

class Tag():
    def __init__(self):
        self.bep:str = ""
        self.hasValue:bool = False
        self.value:int = -1
        self.items:list[Item] = []

class Recipe():
    def __init__(self):
        self.inputs:list[Item] = []
        self.outputs:list[Item] = []
        
    def isResolvable(self) -> bool:
        ret:bool = False
        
        # TODO: Add reverse resolution
        ret = self.isResolvableForwards()
        
        return ret
    
    def isResolvableForwards(self) -> bool:
        ret:bool = True
        
        for inItem in self.inputs:
            if (not inItem.hasValue):
                ret = False
                
        # TODO: Provide resolution when values are partially resolved
        if (len(self.outputs) > 1):
            ret = False
        
        return ret
    
    def isResolvableBackwards(self) -> bool:
        # TODO: Write a reverse resolver function
        return False