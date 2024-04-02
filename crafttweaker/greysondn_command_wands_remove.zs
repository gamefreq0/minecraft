# small handful of projecte things we don't like much
import crafttweaker.api.item.IItemStack;

# don't forget to add a call to the function into main.zs
function greysondn_command_wands_remove_main() as void
{
    # list of all the items we want to remove, as an array.
    var itemsToRemove = [
        # wait, nothing here?
    ] as IItemStack[];

    # defined in grey.zs
    gRemoveAndHideList(itemsToRemove);

    # Items to hide, for various reasons
    var itemsToHide = [
        <item:greysondn_command_wands:worldedit_wand>
    ] as IItemStack[];

    # defined in grey.zs
    gHideList(itemsToHide);
}
