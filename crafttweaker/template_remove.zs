# small handful of projecte things we don't like much
import crafttweaker.api.item.IItemStack;

function template_remove_main() as void
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
}