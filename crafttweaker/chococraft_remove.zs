# small handful of projecte things we don't like much
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
        <item:chococraft_black_chocobo_spawn_egg>,
        <item:chococraft_blue_chocobo_spawn_egg>,
        <item:chococraft_flame_chocobo_spawn_egg>,
        <item:chococraft_gold_chocobo_spawn_egg>,
        <item:chococraft_green_chocobo_spawn_egg>,
        <item:chococraft_pink_chocobo_spawn_egg>,
        <item:chococraft_purple_chocobo_spawn_egg>,
        <item:chococraft_red_chocobo_spawn_egg>,
        <item:chococraft_white_chocobo_spawn_egg>,
        <item:chococraft_yellow_chocobo_spawn_egg>
    ] as IItemStack[];

    # defined in grey.zs
    gHideList(itemsToHide);
}
