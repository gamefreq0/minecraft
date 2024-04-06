# small handful of projecte things we don't like much
import crafttweaker.api.item.IItemStack;

# don't forget to add a call to the function into main.zs
function tombstone_remove_main() as void
{
    # list of all the items we want to remove, as an array.
    var itemsToRemove = [
        <item:tombstone:tablet_of_home>,
        <item:tombstone:tablet_of_recall>
    ] as IItemStack[];

    # defined in grey.zs
    gRemoveAndHideList(itemsToRemove);

    # Items to hide, for various reasons
    var itemsToHide = [
        # wait, nothing here?
    ] as IItemStack[];

    # defined in grey.zs
    gHideList(itemsToHide);
}
