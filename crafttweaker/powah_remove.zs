# small handful of things we don't like much
import crafttweaker.api.item.IItemStack;

function powah_remove_main() as void
{
    # list of all the items we want to remove, as an array.
    var itemsToRemove = [
        <item:powah:energy_cell_starter>,
        <item:powah:energy_cell_basic>,
        <item:powah:energy_cell_hardened>,
        <item:powah:energy_cell_blazing>,
        <item:powah:energy_cell_niotic>,
        <item:powah:energy_cell_spirited>,
        <item:powah:energy_cell_nitro>,
        <item:powah:ender_cell_starter>,
        <item:powah:ender_cell_basic>,
        <item:powah:ender_cell_hardened>,
        <item:powah:ender_cell_blazing>,
        <item:powah:ender_cell_niotic>,
        <item:powah:ender_cell_spirited>,
        <item:powah:ender_cell_nitro>,
        <item:powah:ender_gate_starter>,
        <item:powah:ender_gate_basic>,
        <item:powah:ender_gate_hardened>,
        <item:powah:ender_gate_blazing>,
        <item:powah:ender_gate_niotic>,
        <item:powah:ender_gate_spirited>,
        <item:powah:ender_gate_nitro>,
        <item:powah:energy_discharger_starter>,
        <item:powah:energy_discharger_basic>,
        <item:powah:energy_discharger_hardened>,
        <item:powah:energy_discharger_blazing>,
        <item:powah:energy_discharger_niotic>,
        <item:powah:energy_discharger_spirited>,
        <item:powah:energy_discharger_nitro>,
        <item:powah:energy_hopper_starter>,
        <item:powah:energy_hopper_basic>,
        <item:powah:energy_hopper_hardened>,
        <item:powah:energy_hopper_blazing>,
        <item:powah:energy_hopper_niotic>,
        <item:powah:energy_hopper_spirited>,
        <item:powah:energy_hopper_nitro>,
        <item:powah:player_transmitter_starter>,
        <item:powah:player_transmitter_basic>,
        <item:powah:player_transmitter_hardened>,
        <item:powah:player_transmitter_blazing>,
        <item:powah:player_transmitter_niotic>,
        <item:powah:player_transmitter_spirited>,
        <item:powah:player_transmitter_nitro>,
        <item:powah:player_aerial_pearl>,
        <item:powah:solar_panel_starter>,
        <item:powah:solar_panel_basic>,
        <item:powah:solar_panel_hardened>,
        <item:powah:solar_panel_blazing>,
        <item:powah:solar_panel_niotic>,
        <item:powah:solar_panel_spirited>,
        <item:powah:solar_panel_nitro>,
        <item:powah:thermo_generator_starter>,
        <item:powah:thermo_generator_basic>,
        <item:powah:thermo_generator_hardened>,
        <item:powah:thermo_generator_blazing>,
        <item:powah:thermo_generator_niotic>,
        <item:powah:thermo_generator_spirited>,
        <item:powah:thermo_generator_nitro>,


        <item:powah:aerial_pearl>,
        <item:powah:binding_card>,
        <item:powah:binding_card_dim>,
        <item:powah:lens_of_ender>
    ] as IItemStack[];

    # defined in grey.zs
    gRemoveAndHideList(itemsToRemove);

    # Items to hide, for various reasons
    var itemsToHide = [
        <item:powah:energy_cell_creative>
    ] as IItemStack[];

    # defined in grey.zs
    gHideList(itemsToHide);
}
