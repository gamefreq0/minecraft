# small handful of projecte things we don't like much
import crafttweaker.api.item.IItemStack;

# list of all the items we want to remove, as an array.
var itemsToRemove = [
    # wait, nothing here?
] as IItemStack[];

# defined in grey.zs
gRemoveAndHideList(itemsToRemove);

# Items to hide, for various reasons
var itemsToHide = [
    <item:minecraft:bat_spawn_egg>,
    <item:minecraft:bee_spawn_egg>,
    <item:minecraft:blaze_spawn_egg>,
    <item:minecraft:cat_spawn_egg>,
    <item:minecraft:chicken_spawn_egg>,
    <item:minecraft:cod_spawn_egg>,
    <item:minecraft:cow_spawn_egg>,
    <item:minecraft:creeper_spawn_egg>,
    <item:minecraft:dolphin_spawn_egg>,
    <item:minecraft:donkey_spawn_egg>,
    <item:minecraft:drowned_spawn_egg>,
    <item:minecraft:elder_guardian_spawn_egg>,
    <item:minecraft:enderman_spawn_egg>,
    <item:minecraft:endermite_spawn_egg>,
    <item:minecraft:evoker_spawn_egg>,
    <item:minecraft:fox_spawn_egg>,
    <item:minecraft:ghast_spawn_egg>,
    <item:minecraft:guardian_spawn_egg>,
    <item:minecraft:hoglin_spawn_egg>,
    <item:minecraft:horse_spawn_egg>,
    <item:minecraft:husk_spawn_egg>,
    <item:minecraft:llama_spawn_egg>,
    <item:minecraft:magma_cube_spawn_egg>,
    <item:minecraft:mooshroom_spawn_egg>,
    <item:minecraft:mule_spawn_egg>,
    <item:minecraft:ocelot_spawn_egg>,
    <item:minecraft:panda_spawn_egg>,
    <item:minecraft:parrot_spawn_egg>,
    <item:minecraft:phantom_spawn_egg>,
    <item:minecraft:pig_spawn_egg>,
    <item:minecraft:piglin_brute_spawn_egg>,
    <item:minecraft:piglin_spawn_egg>,
    <item:minecraft:pillager_spawn_egg>,
    <item:minecraft:polar_bear_spawn_egg>,
    <item:minecraft:pufferfish_spawn_egg>,
    <item:minecraft:rabbit_spawn_egg>,
    <item:minecraft:ravager_spawn_egg>,
    <item:minecraft:salmon_spawn_egg>,
    <item:minecraft:sheep_spawn_egg>,
    <item:minecraft:shulker_spawn_egg>,
    <item:minecraft:silverfish_spawn_egg>,
    <item:minecraft:skeleton_horse_spawn_egg>,
    <item:minecraft:skeleton_spawn_egg>,
    <item:minecraft:slime_spawn_egg>,
    <item:minecraft:spider_spawn_egg>,
    <item:minecraft:spider_spawn_egg>,
    <item:minecraft:squid_spawn_egg>,
    <item:minecraft:stray_spawn_egg>,
    <item:minecraft:strider_spawn_egg>,
    <item:minecraft:trader_llama_spawn_egg>,
    <item:minecraft:tropical_fish_spawn_egg>,
    <item:minecraft:turtle_spawn_egg>,
    <item:minecraft:vex_spawn_egg>,
    <item:minecraft:villager_spawn_egg>,
    <item:minecraft:vindicator_spawn_egg>,
    <item:minecraft:wandering_trader_spawn_egg>,
    <item:minecraft:witch_spawn_egg>,
    <item:minecraft:wither_skeleton_spawn_egg>,
    <item:minecraft:wolf_spawn_egg>,
    <item:minecraft:zoglin_spawn_egg>,
    <item:minecraft:zombie_horse_spawn_egg>,
    <item:minecraft:zombie_spawn_egg>,
    <item:minecraft:zombie_villager_spawn_egg>,
    <item:minecraft:zombified_piglin_spawn_egg>
] as IItemStack[];

# defined in grey.zs
gHideList(itemsToHide);