# small handful of things we don't like much
import crafttweaker.api.item.IItemStack;

function bountifulbaubles_remove_main() as void
{
    # list of all the items we want to remove, as an array.
    var itemsToRemove = [
        <item:bountifulbaubles:apple>,
        <item:bountifulbaubles:broken_heart>,     # it's okay, except we never sleep on my server
        <item:bountifulbaubles:magic_mirror>,     # see: waystones:warpstone
        <item:bountifulbaubles:obsidian_skull>,    # there is a better one in artifacts.
        <item:bountifulbaubles:phylactery_charm>,
        <item:bountifulbaubles:potion_recall>,    # see: waystones:warpstone
        <item:bountifulbaubles:vitamins>,
        <item:bountifulbaubles:water_candle>,     # wc is not implemented
        <item:bountifulbaubles:wormhole_mirror>   # see: waystones:warpstone
    ] as IItemStack[];

    # items I'm definitely okay with:
    # umbrella

    # defined in grey.zs
    gRemoveAndHideList(itemsToRemove);

    # Items to hide, for various reasons
    var itemsToHide = [
        # wait, nothing here?
    ] as IItemStack[];

    # defined in grey.zs
    gHideList(itemsToHide);
}
