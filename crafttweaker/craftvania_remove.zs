# small handful of things we don't like much
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
        <item:craftvania2:dark_meta_item>,
        <item:craftvania2:daybreak>,
        <item:craftvania2:doublejumpnecklace>,
        <item:craftvania2:firerelic>,
        <item:craftvania2:hastering>,
        <item:craftvania2:hellfire_item>,
        <item:craftvania2:hp_up>,
        <item:craftvania2:icerelic>,
        <item:craftvania2:inviscloak>,
        <item:craftvania2:invispotion>,
        <item:craftvania2:jewel_sword>,
        <item:craftvania2:masamune>,
        <item:craftvania2:medusapendant>,
        <item:craftvania2:mermaid_statue>,
        <item:craftvania2:moruneblade>,
        <item:craftvania2:skull_ring>,
        <item:craftvania2:soul_steal_item>,
        <item:craftvania2:stopwatchitem>,
        <item:craftvania2:stopwatchitemretro>,
        <item:craftvania2:talisman>,
        <item:craftvania2:tearofblood>,
        <item:craftvania2:vladeye>,
        <item:craftvania2:vladring>,
        <item:craftvania2:vorpal_blade>,
        <item:craftvania2:wing_item>
    ] as IItemStack[];

    # defined in grey.zs
    gRemoveAndHideList(itemsToRemove);

    # Items to hide, for various reasons
    var itemsToHide = [
        <item:craftvania2:cv_leviathan_spawn_egg>,
        <item:craftvania2:cvaxearmor_spawn_egg>,
        <item:craftvania2:cvcreature_spawn_egg>,
        <item:craftvania2:cvectoplasm_spawn_egg>,
        <item:craftvania2:cvfireman_spawn_egg>,
        <item:craftvania2:cvfleaman_spawn_egg>,
        <item:craftvania2:cvfrozenshade_spawn_egg>,
        <item:craftvania2:cvghoul_spawn_egg>,
        <item:craftvania2:cvgoldmedusahead_spawn_egg>,
        <item:craftvania2:cvgoldskeleton_spawn_egg>,
        <item:craftvania2:cvheatshade_spawn_egg>,
        <item:craftvania2:cvkillerdoll_spawn_egg>,
        <item:craftvania2:cvknight_spawn_egg>,
        <item:craftvania2:cvlegion_spawn_egg>,
        <item:craftvania2:cvlegionzombie_spawn_egg>,
        <item:craftvania2:cvmedusahead_spawn_egg>,
        <item:craftvania2:cvmerman_spawn_egg>,
        <item:craftvania2:cvmudman_spawn_egg>,
        <item:craftvania2:cvmummy_spawn_egg>,
        <item:craftvania2:cvnemesis_spawn_egg>,
        <item:craftvania2:cvpoisonghoul_spawn_egg>,
        <item:craftvania2:cvredskeleton_spawn_egg>,
        <item:craftvania2:cvskeleton_sprinter_spawn_egg>,
        <item:craftvania2:cvstonegolem_spawn_egg>,
        <item:craftvania2:cvvampire_spawn_egg>,
        <item:craftvania2:cvwerewolf_spawn_egg>,
        <item:craftvania2:cvwhipskeleton_spawn_egg>,
        <item:craftvania2:cvwoodgolem_spawn_egg>
    ] as IItemStack[];

    # defined in grey.zs
    gHideList(itemsToHide);
}
