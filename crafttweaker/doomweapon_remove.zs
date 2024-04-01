# small handful of doomweapons we don't like much
import crafttweaker.api.item.IItemStack;

function doomweapon_remove_main() as void
{
    # list of all the items we want to remove, as an array.
    var itemsToRemove = [
        <item:doom:argent_axe>,
        <item:doom:argent_bolt>,
        <item:doom:argent_hoe>,
        <item:doom:argent_paxel>,
        <item:doom:argent_pickaxe>,
        <item:doom:argent_shovel>,
        <item:doom:argent_sword>,
        <item:doom:astro_doom_boots>,
        <item:doom:astro_doom_chestplate>,
        <item:doom:astro_doom_helmet>,
        <item:doom:astro_doom_leggings>,
        <item:doom:axe_marauder_closed>,
        <item:doom:axe_marauder_open>,
        <item:doom:ballista>,
        <item:doom:bfg_eternal>,
        <item:doom:bronze_doom_boots>,
        <item:doom:bronze_doom_chestplate>,
        <item:doom:bronze_doom_helmet>,
        <item:doom:bronze_doom_leggings>,
        <item:doom:chainsaw64>,
        <item:doom:chainsaweternal>,
        <item:doom:classic_black_chestplate>,
        <item:doom:classic_black_leggings>,
        <item:doom:classic_bronze_chestplate>,
        <item:doom:classic_bronze_leggings>,
        <item:doom:classic_doom_boots>,
        <item:doom:classic_doom_chestplate>,
        <item:doom:classic_doom_helmet>,
        <item:doom:classic_doom_leggings>,
        <item:doom:classic_red_chestplate>,
        <item:doom:classic_red_leggings>,
        <item:doom:crimson_doom_boots>,
        <item:doom:crimson_doom_chestplate>,
        <item:doom:crimson_doom_helmet>,
        <item:doom:crimson_doom_leggings>,
        <item:doom:cruciblesword>,
        <item:doom:cruciblesword_closed>,
        <item:doom:cultist_doom_boots>,
        <item:doom:cultist_doom_chestplate>,
        <item:doom:cultist_doom_helmet>,
        <item:doom:cultist_doom_leggings>,
        <item:doom:daisy>,
        <item:doom:darklord_boots>,
        <item:doom:darklord_chestplate>,
        <item:doom:darklord_helmet>,
        <item:doom:darklord_leggings>,
        <item:doom:darklordcrucible>,
        <item:doom:demoncide_doom_boots>,
        <item:doom:demoncide_doom_chestplate>,
        <item:doom:demoncide_doom_helmet>,
        <item:doom:demoncide_doom_leggings>,
        <item:doom:demonic_doom_boots>,
        <item:doom:demonic_doom_chestplate>,
        <item:doom:demonic_doom_helmet>,
        <item:doom:demonic_doom_leggings>,
        <item:doom:doom_boots>,
        <item:doom:doom_chestplate>,
        <item:doom:doom_helmet>,
        <item:doom:doom_leggings>,
        <item:doom:doomicorn_doom_boots>,
        <item:doom:doomicorn_doom_chestplate>,
        <item:doom:doomicorn_doom_helmet>,
        <item:doom:doomicorn_doom_leggings>,
        <item:doom:ember_doom_boots>,
        <item:doom:ember_doom_chestplate>,
        <item:doom:ember_doom_helmet>,
        <item:doom:ember_doom_leggings>,
        <item:doom:gold_doom_boots>,
        <item:doom:gold_doom_chestplate>,
        <item:doom:gold_doom_helmet>,
        <item:doom:gold_doom_leggings>,
        <item:doom:heavycannon>,
        <item:doom:hotrod_boots>,
        <item:doom:hotrod_chestplate>,
        <item:doom:hotrod_helmet>,
        <item:doom:hotrod_leggings>,
        <item:doom:maykr_doom_boots>,
        <item:doom:maykr_doom_chestplate>,
        <item:doom:maykr_doom_helmet>,
        <item:doom:maykr_doom_leggings>,
        <item:doom:midnight_doom_boots>,
        <item:doom:midnight_doom_chestplate>,
        <item:doom:midnight_doom_helmet>,
        <item:doom:midnight_doom_leggings>,
        <item:doom:nightmare_doom_boots>,
        <item:doom:nightmare_doom_chestplate>,
        <item:doom:nightmare_doom_helmet>,
        <item:doom:nightmare_doom_leggings>,
        <item:doom:painter_doom_chestplate>,
        <item:doom:painter_doom_helmet>,
        <item:doom:phobos_doom_boots>,
        <item:doom:phobos_doom_chestplate>,
        <item:doom:phobos_doom_helmet>,
        <item:doom:phobos_doom_leggings>,
        <item:doom:praetor_doom_boots>,
        <item:doom:praetor_doom_chestplate>,
        <item:doom:praetor_doom_helmet>,
        <item:doom:praetor_doom_leggings>,
        <item:doom:purplepony_doom_boots>,
        <item:doom:purplepony_doom_chestplate>,
        <item:doom:purplepony_doom_helmet>,
        <item:doom:purplepony_doom_leggings>,
        <item:doom:redneck_doom1_boots>,
        <item:doom:redneck_doom1_chestplate>,
        <item:doom:redneck_doom1_helmet>,
        <item:doom:redneck_doom1_leggings>,
        <item:doom:redneck_doom2_chestplate>,
        <item:doom:redneck_doom3_chestplate>,
        <item:doom:santa_helmet>,
        <item:doom:sentinel_doom_boots>,
        <item:doom:sentinel_doom_chestplate>,
        <item:doom:sentinel_doom_helmet>,
        <item:doom:sentinel_doom_leggings>,
        <item:doom:sentinelhammer>,
        <item:doom:soulcube>,
        <item:doom:twenty_five_boots>,
        <item:doom:twenty_five_chestplate>,
        <item:doom:twenty_five_helmet>,
        <item:doom:twenty_five_leggings>,
        <item:doom:unmaykr>,
        <item:doom:unmaykr_bolt>,
        <item:doom:zombie_doom_boots>,
        <item:doom:zombie_doom_chestplate>,
        <item:doom:zombie_doom_helmet>,
        <item:doom:zombie_doom_leggings>
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
