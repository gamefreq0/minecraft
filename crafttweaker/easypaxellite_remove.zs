# small handful of things we don't like much
import crafttweaker.api.item.IItemStack;

# don't forget to add a call to the function into main.zs
function easypaxellite_remove_main() as void
{
    # list of all the items we want to remove, as an array.
    var itemsToRemove = [
        # wait, nothing here?
    ] as IItemStack[];

    # defined in grey.zs
    gRemoveAndHideList(itemsToRemove);

    # Items to hide, for various reasons
    var itemsToHide = [
        <item:easypaxellite:adamantium_paxel>,
        <item:easypaxellite:bone_paxel>,
        <item:easypaxellite:coal_paxel>,
        <item:easypaxellite:copper_paxel>,
        <item:easypaxellite:emerald_paxel>,
        <item:easypaxellite:ender_paxel>,
        <item:easypaxellite:fiery_paxel>,
        <item:easypaxellite:glowstone_paxel>,
        <item:easypaxellite:lapis_paxel>,
        <item:easypaxellite:mythril_paxel>,
        <item:easypaxellite:nether_paxel>,
        <item:easypaxellite:obsidian_paxel>,
        <item:easypaxellite:onyx_paxel>,
        <item:easypaxellite:paper_paxel>,
        <item:easypaxellite:prismarine_paxel>,
        <item:easypaxellite:quartz_paxel>,
        <item:easypaxellite:redstone_paxel>,
        <item:easypaxellite:slime_paxel>,
        <item:easypaxellite:tempered_netherite_paxel>,
        <item:easypaxellite:tin_paxel>
    ] as IItemStack[];

    # defined in grey.zs
    gHideList(itemsToHide);
}
