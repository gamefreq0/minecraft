# small handful of projecte things we don't like much
import crafttweaker.api.item.IItemStack;

# don't forget to add a call to the function into main.zs
function craftvania_remove_main() as void
{
    # list of all the items we want to remove, as an array.
    var itemsToRemove = [
        <item:craftvania2:alucard_sword>,
        <item:craftvania2:alucard_sword_modern>,
        <item:craftvania2:astralring>,
        <item:craftvania2:backdashcube>,
        <item:craftvania2:bast_soul_item>,
        <item:craftvania2:bloodstone>,
        <item:craftvania2:crissaegrim>,
        <item:craftvania2:daybreak>,
        <item:craftvania2:doublejumpnecklace>,
        <item:craftvania2:firerelic>,
        <item:craftvania2:hastering>,
        <item:craftvania2:hellfire_item>,
        <item:craftvania2:hp_up>,
        <item:craftvania2:icerelic>,
        <item:craftvania2:inviscloak>,
        <item:craftvania2:invispotion>,
        <item:craftvania2:masamune>,
        <item:craftvania2:medusapendant>,
        <item:craftvania2:mermaid_statue>,
        <item:craftvania2:skull_ring>,
        <item:craftvania2:soul_steal_item>,
        <item:craftvania2:stopwatchitem>,
        <item:craftvania2:stopwatchitemretro>,
        <item:craftvania2:talisman>,
        <item:craftvania2:tearofblood>,
        <item:craftvania2:vladeye>,
        <item:craftvania2:vladring>,
        <item:craftvania2:vorpal_blade>,
        <item:craftvania2:wing_item>,
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
