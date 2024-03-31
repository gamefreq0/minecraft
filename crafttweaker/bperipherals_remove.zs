# small handful of projecte things we don't like much
import crafttweaker.api.item.IItemStack;

# list of all the items we want to remove, as an array.
var itemsToRemove = [
    # use advanced peripherals energy detector instead
    <item:bperipherals:fe_meter>,

    # use security craft cards instead
    <item:bperipherals:mag_card>,
    <item:bperipherals:mag_card_reader>
] as IItemStack[];

# defined in grey.zs
gRemoveAndHideList(itemsToRemove);

# Items to hide, for various reasons
var itemsToHide = [
    # wait, nothing here?
] as IItemStack[];

# defined in grey.zs
gHideList(itemsToHide);