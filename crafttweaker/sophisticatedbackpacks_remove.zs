# small handful of projecte things we don't like much
import crafttweaker.api.item.IItemStack;

# list of all the items we want to remove, as an array.
var itemsToRemove = [
    <item:sophisticatedbackpacks:compacting_upgrade>,
    <item:sophisticatedbackpacks:advanced_compacting_upgrade>,
    <item:sophisticatedbackpacks:smelting_upgrade>,
    <item:sophisticatedbackpacks:auto_smelting_upgrade>,
    <item:sophisticatedbackpacks:crafting_upgrade>,
    <item:sophisticatedbackpacks:stonecutter_upgrade>
] as IItemStack[];

# defined in grey.zs
gRemoveAndHideList(itemsToRemove);

# Items to hide, for various reasons
var itemsToHide = [
    # wait, nothing here?
] as IItemStack[];

# defined in grey.zs
gHideList(itemsToHide);