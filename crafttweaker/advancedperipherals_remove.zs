# small handful of things we don't like much
import crafttweaker.api.item.IItemStack;

# don't forget to add a call to the function into main.zs
function advancedperipherals_remove_main() as void
{
    # list of all the items we want to remove, as an array.
    var itemsToRemove = [
        <item:advancedperipherals:chunk_controller>,
        <item:advancedperipherals:computer_tool>,
        <item:advancedperipherals:end_automata_core>,
        <item:advancedperipherals:husbandry_automata_core>,
        <item:advancedperipherals:overpowered_end_automata_core>,
        <item:advancedperipherals:overpowered_husbandry_automata_core>,
        <item:advancedperipherals:overpowered_weak_automata_core>,
        <item:advancedperipherals:rs_bridge>,
        <item:advancedperipherals:weak_automata_core>
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