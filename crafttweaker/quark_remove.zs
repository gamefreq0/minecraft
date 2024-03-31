# small handful of artifacts we don't like much
import crafttweaker.api.item.IItemStack;

# list of all the items we want to remove, as an array.
var itemsToRemove = [
    # we have sophicated backpacks in this pack, so nooo.
    <item:quark:backpack>,
] as IItemStack[];

# defined in grey.zs
gRemoveAndHideList(itemsToRemove);

# Items to hide, for various reasons
var itemsToHide = [
    # wait, nothing here?
] as IItemStack[];

# defined in grey.zs
gHideList(itemsToHide);