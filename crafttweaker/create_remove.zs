# small handful of things we don't like much
import crafttweaker.api.item.IItemStack;

# don't forget to add a call to the function into main.zs
function create_remove_main() as void
{
    # list of all the items we want to remove, as an array.
    var itemsToRemove = [
        <item:create:empty_schematic>,
        <item:create:schematicannon>,
        <item:create:schematic_and_quill>,
        <item:create:schematic_table>,
        <item:create:water_wheel>,
        <item:create:windmill_bearing>,

        # <item:createaddition:alternator>,

        # <item:steampowered:alternator>
    ] as IItemStack[];

    # defined in grey.zs
    gRemoveAndHideList(itemsToRemove);

    # Items to hide, for various reasons
    var itemsToHide = [
        <item:create:creative_crate>,
        <item:create:creative_fluid_tank>,
        <item:create:creative_motor>,
        <item:create:handheld_worldshaper>,

        <item:createaddition:creative_energy>
    ] as IItemStack[];

    # defined in grey.zs
    gHideList(itemsToHide);
}
