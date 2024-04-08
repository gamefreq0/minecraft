# small handful of things we don't like much
import crafttweaker.api.item.IItemStack;

# don't forget to add a call to the function into main.zs
function mekanism_remove_main() as void
{
    # list of all the items we want to remove, as an array.
    var itemsToRemove = [
        <item:mekanism:digital_miner>,
        <item:mekanism:module_solar_recharging_unit>,
        <item:mekanism:module_teleportation_unit>,
        <item:mekanism:module_vein_mining_unit>,
        <item:mekanism:personal_chest>,
        <item:mekanism:portable_teleporter>,
        <item:mekanism:quantum_entangloporter>,
        <item:mekanism:teleporter>,
        <item:mekanism:upgrade_anchor>,
        <item:mekanism:upgrade_stone_generator>,

        <item:mekanismadditions:walkie_talkie>,

        <item:mekanismgenerators:advanced_solar_generator>,
        <item:mekanismgenerators:module_geothermal_generator_unit>,
        <item:mekanismgenerators:solar_generator>,
        <item:mekanismgenerators:solar_panel>,
        <item:mekanismgenerators:wind_generator>
    ] as IItemStack[];

    # defined in grey.zs
    gRemoveAndHideList(itemsToRemove);

    # Items to hide, for various reasons
    var itemsToHide = [
        <item:mekanism:creative_chemical_tank>,
        <item:mekanism:creative_energy_cube>,
        <item:mekanism:creative_fluid_tank>,

        <item:mekanismadditions:baby_creeper_spawn_egg>,
        <item:mekanismadditions:baby_enderman_spawn_egg>,
        <item:mekanismadditions:baby_skeleton_spawn_egg>,
        <item:mekanismadditions:baby_stray_spawn_egg>,
        <item:mekanismadditions:baby_wither_skeleton_spawn_egg>
    ] as IItemStack[];

    # defined in grey.zs
    gHideList(itemsToHide);
}
