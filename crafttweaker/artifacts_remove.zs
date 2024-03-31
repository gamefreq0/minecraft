# small handful of artifacts we don't like much
import crafttweaker.api.item.IItemStack;

function artifacts_remove_main() as void
{
    # list of all the items we want to remove, as an array.
    var itemsToRemove = [
        <item:artifacts:everlasting_beef>,
        <item:artifacts:eternal_steak>,
        <item:artifacts:scarf_of_invisibility>,
        <item:artifacts:whoopee_cushion>,
        
        <item:artifacts:night_vision_goggles> # no batteries, OP
        
        # <item:artifacts:star_cloak>,          # no longer exists?
        # <item:artifacts:ultimate_pendant>,    # no longer exists?
        # <item:artifacts:tiny_shirt>           # no longer exists?
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
