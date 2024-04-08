# small handful of things we don't like much
import crafttweaker.api.item.IItemStack;

# don't forget to add a call to the function into main.zs
function mekanism_remove_main() as void
{
    # list of all the items we want to remove, as an array.
    var itemsToRemove = [
        <mekanism:digital_miner>,
        <mekanism:module_solar_recharging_unit>,
        <mekanism:module_teleportation_unit>,
        <mekanism:module_vein_mining_unit>,
        <mekanism:personal_chest>,
        <mekanism:portable_teleporter>,
        <mekanism:quantum_entangloporter>,
        <mekanism:teleporter>,
        <mekanism:upgrade_anchor>,
        <mekanism:upgrade_stone_generator>,

        <mekanismadditions:walkie_talkie>,

        <mekanismgenerators:advanced_solar_generator>,
        <mekanismgenerators:module_geothermal_generator_unit>,
        <mekanismgenerators:solar_generator>,
        <mekanismgenerators:solar_panel>,
        <mekanismgenerators:wind_generator>,
    ] as IItemStack[];

    # defined in grey.zs
    gRemoveAndHideList(itemsToRemove);

    # Items to hide, for various reasons
    var itemsToHide = [
        <mekanism:creatie_chemical_tank>,
        <mekanism:creative_energy_cube>,
        <mekanism:creative_fluid_tank>,

        <mekanismadditions:baby_creeper_spawn_egg>,
        <mekanismadditions:baby_enderman_spawn_egg>,
        <mekanismadditions:baby_skeletion_spawn_egg>,
        <mekanismadditions:baby_stray_spawn_egg>,
        <mekanismadditions:baby_wither_skeletion_spawn_egg>
    ] as IItemStack[];

    # defined in grey.zs
    gHideList(itemsToHide);
}
