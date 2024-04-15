# small handful of things we don't like much
import crafttweaker.api.item.IItemStack;

# don't forget to add a call to the function into main.zs
function botania_remove_main() as void
{
    # list of all the items we want to remove, as an array.
    var itemsToRemove = [
        <item:botania:auto_crafting_halo>,
        <item:botania:crafting_halo>,
        <item:botania:floating_hopperhock>,
        <item:botania:floating_hopperhock_chibi>,
        <item:botania:hopperhock>,
        <item:botania:hopperhock_chibi>,
        <item:botania:floating_orechid>,
        <item:botania:floating_orechid_ignem>,
        <item:botania:light_launcher>,
        <item:botania:orechid>,
        <item:botania:orechid_ignem>,
        <item:botania:world_seed>
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
