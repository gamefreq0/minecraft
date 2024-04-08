# small handful of things we don't like much
import crafttweaker.api.item.IItemStack;

# don't forget to add a call to the function into main.zs
function chococraft_remove_main() as void
{
    # list of all the items we want to remove, as an array.
    var itemsToRemove = [
        # wait, nothing here?
    ] as IItemStack[];

    # defined in grey.zs
    gRemoveAndHideList(itemsToRemove);

    # Items to hide, for various reasons
    var itemsToHide = [
        <item:chococraft:black_chocobo_spawn_egg>,
        <item:chococraft:blue_chocobo_spawn_egg>,
        <item:chococraft:flame_chocobo_spawn_egg>,
        <item:chococraft:gold_chocobo_spawn_egg>,
        <item:chococraft:green_chocobo_spawn_egg>,
        <item:chococraft:pink_chocobo_spawn_egg>,
        <item:chococraft:purple_chocobo_spawn_egg>,
        <item:chococraft:red_chocobo_spawn_egg>,
        <item:chococraft:white_chocobo_spawn_egg>,
        <item:chococraft:yellow_chocobo_spawn_egg>
    ] as IItemStack[];

    # defined in grey.zs
    gHideList(itemsToHide);
}
