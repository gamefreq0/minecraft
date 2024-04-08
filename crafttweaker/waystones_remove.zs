# small handful of things we don't like much
import crafttweaker.api.item.IItemStack;

# don't forget to add a call to the function into main.zs
function waystones_remove_main() as void
{
    # list of all the items we want to remove, as an array.
    var itemsToRemove = [
        <item:waystones:warp_stone>,

        # can't do sharestones with warp stone banned
        <item:waystones:sharestone>,
        <item:waystones:white_sharestone>,
        <item:waystones:orange_sharestone>,
        <item:waystones:magenta_sharestone>,
        <item:waystones:light_blue_sharestone>,
        <item:waystones:yellow_sharestone>,
        <item:waystones:lime_sharestone>,
        <item:waystones:pink_sharestone>,
        <item:waystones:gray_sharestone>,
        <item:waystones:light_gray_sharestone>,
        <item:waystones:cyan_sharestone>,
        <item:waystones:purple_sharestone>,
        <item:waystones:blue_sharestone>,
        <item:waystones:brown_sharestone>,
        <item:waystones:green_sharestone>,
        <item:waystones:black_sharestone>
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
