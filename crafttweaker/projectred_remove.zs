# small handful of artifacts we don't like much
import crafttweaker.api.item.IItemStack;

# list of all the items we want to remove, as an array.
var itemsToRemove = [
    # we have sophicated backpacks in this pack, so nooo.
    <item:projectred-exploration:black_backpack>,
    <item:projectred-exploration:blue_backpack>,
    <item:projectred-exploration:brown_backpack>,
    <item:projectred-exploration:cyan_backpack>,
    <item:projectred-exploration:gray_backpack>,
    <item:projectred-exploration:green_backpack>,
    <item:projectred-exploration:light_blue_backpack>,
    <item:projectred-exploration:light_gray_backpack>,
    <item:projectred-exploration:lime_backpack>,
    <item:projectred-exploration:magenta_backpack>,
    <item:projectred-exploration:orange_backpack>,
    <item:projectred-exploration:pink_backpack>,
    <item:projectred-exploration:purple_backpack>,
    <item:projectred-exploration:red_backpack>,
    <item:projectred-exploration:white_backpack>,
    <item:projectred-exploration:yellow_backpack>,
] as IItemStack[];

# defined in grey.zs
gRemoveAndHideList(itemsToRemove);

# Items to hide, for various reasons
var itemsToHide = [
    # wait, nothing here?
] as IItemStack[];

# defined in grey.zs
gHideList(itemsToHide);