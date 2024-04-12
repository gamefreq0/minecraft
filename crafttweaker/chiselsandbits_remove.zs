# small handful of things we don't like much
import crafttweaker.api.item.IItemStack;

# don't forget to add a call to the function into main.zs
function chiselsandbits_remove_main() as void
{
    # list of all the items we want to remove, as an array.
    var itemsToRemove = [
        # wait, nothing here?
    ] as IItemStack[];

    # defined in grey.zs
    gRemoveAndHideList(itemsToRemove);

    # Items to hide, for various reasons
    var itemsToHide = [
        # wait, nothing here?
    ] as IItemStack[];

    # defined in grey.zs
    gHideList(itemsToHide);

    # Not trying to ban or hide items so...
    var itemsToUnrecipe = [
        <item:chiselsandbits:block_bit>
    ] as IItemStack[];

    # defined in grey.zs
    for _item in itemsToUnrecipe
    {
        gHide(_item);
    }
}