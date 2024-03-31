# small handful of projecte things we don't like much
import crafttweaker.api.item.IItemStack;

# list of all the items we want to remove, as an array.
var itemsToRemove = [
    # alchemical bags
    <item:projecte:black_alchemical_bag>,
    <item:projecte:blue_alchemical_bag>,
    <item:projecte:brown_alchemical_bag>,
    <item:projecte:cyan_alchemical_bag>,
    <item:projecte:gray_alchemical_bag>,
    <item:projecte:green_alchemical_bag>,
    <item:projecte:light_blue_alchemical_bag>,
    <item:projecte:light_gray_alchemical_bag>,
    <item:projecte:lime_alchemical_bag>,
    <item:projecte:magenta_alchemical_bag>,
    <item:projecte:orange_alchemical_bag>,
    <item:projecte:pink_alchemical_bag>,
    <item:projecte:purple_alchemical_bag>,
    <item:projecte:red_alchemical_bag>,
    <item:projecte:white_alchemical_bag>,
    <item:projecte:yellow_alchemical_bag>,

    # antimatter relays
    <item:projecte:relay_mk1>,
    <item:projecte:relay_mk2>,
    <item:projecte:relay_mk3>,

    # Archangel's Smite
    <item:projecte:archangel_smite>,

    # Black Hole Band
    <item:projecte:black_hole_band>,

    # Body Stone
    <item:projecte:body_stone>,

    # Catalytic Lens
    <item:projecte:catalytic_lens>,

    # Dark Matter Armor
    <item:projecte:dm_boots>,
    <item:projecte:dm_chestplate>,
    <item:projecte:dm_helmet>,
    <item:projecte:dm_leggings>,

    # Dark Matter Pedestal
    <item:projecte:dm_pedestal>,

    # Dark Matter Tools
    <item:projecte:dm_axe>,
    <item:projecte:dm_hammer>,
    <item:projecte:dm_hoe>,
    <item:projecte:dm_pick>,
    <item:projecte:dm_shears>,
    <item:projecte:dm_shovel>,
    <item:projecte:dm_sword>,

    # Destruction Catalyst
    <item:projecte:destruction_catalyst>,

    # Energy Collector
    <item:projecte:collector_mk1>,
    <item:projecte:collector_mk2>,
    <item:projecte:collector_mk3>,

    # Energy Condensor
    <item:projecte:condenser_mk1>,
    <item:projecte:condenser_mk2>,

    # Evertide Amulet
    <item:projecte:evertide_amulet>,

    # Gem Armor
    <item:projecte:gem_boots>,
    <item:projecte:gem_chestplate>,
    <item:projecte:gem_helmet>,
    <item:projecte:gem_leggings>,

    # Gem of Eternal Density
    <item:projecte:gem_of_eternal_density>,

    # Harvest Goddess Band
    <item:projecte:harvest_goddess_band>,

    # Hyperkinetic Lens
    <item:projecte:hyperkinetic_lens>,

    # Ignition Ring
    <item:projecte:ignition_ring>,

    # Iron Band
    <item:projecte:iron_band>,

    # Interdiction Torch
    <item:projecte:interdiction_torch>,

    # Life Stone
    <item:projecte:life_stone>,

    # Mercurial Eye
    <item:projecte:mercurial_eye>,

    # Mind Stone
    <item:projecte:mind_stone>,

    # Red Matter Armor
    <item:projecte:rm_boots>,
    <item:projecte:rm_chestplate>,
    <item:projecte:rm_helmet>,
    <item:projecte:rm_leggings>,

    # Red Matter Tools
    <item:projecte:rm_axe>,
    <item:projecte:rm_hammer>,
    <item:projecte:rm_hoe>,
    <item:projecte:rm_katar>,
    <item:projecte:rm_morning_star>,
    <item:projecte:rm_pick>,
    <item:projecte:rm_shears>,
    <item:projecte:rm_shovel>,
    <item:projecte:rm_sword>,

    # Repair Talisman
    <item:projecte:repair_talisman>,

    # Ring of Arcana
    <item:projecte:arcana_ring>,

    # Soul Stone
    <item:projecte:soul_stone>,

    # Swiftwolf's Rending Gale
    <item:projecte:swiftwolf_rending_gale>,

    # Tome - who needs it anyway
    <item:projecte:tome>,

    # Void Ring
    <item:projecte:void_ring>,

    # Volcanite Amulet
    <item:projecte:volcanite_amulet>,

    # Watch of Flowing Time
    <item:projecte:watch_of_flowing_time>,
    
    # Zero Ring
    <item:projecte:zero_ring>
] as IItemStack[];

# defined in grey.zs
gRemoveAndHideList(itemsToRemove);

# Items to hide, for various reasons
var itemsToHide = [
    # wait, nothing here?
] as IItemStack[];

# defined in grey.zs
gHideList(itemsToHide);
