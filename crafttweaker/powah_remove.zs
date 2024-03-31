# small handful of projecte things we don't like much
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
        <item:powah:energy_cell_creative>,
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
        <item:powah:player_transmitter_starter>,
        <item:powah:player_transmitter_basic>,
        <item:powah:player_transmitter_hardened>,
        <item:powah:player_transmitter_blazing>,
        <item:powah:player_transmitter_niotic>,
        <item:powah:player_transmitter_spirited>,
        <item:powah:player_transmitter_nitro>,
        <item:powah:player_aerial_pearl>,
        <item:powah:binding_card>,
        <item:powah:binding_card_dim>
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
