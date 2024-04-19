import crafttweaker.api.recipe.Replacer;

function pack_unification_main() as void
{
    # --------------------------------------------------------------------------
    # Recipe Replacements
    # --------------------------------------------------------------------------

    # First, create replacer
    var replacer as Replacer = Replacer.forEverything();

    # Certus Quartz - AE2 (AE2, EE)
    replacer.replace(<item:emendatusenigmatica:certus_quartz_gem>, <item:appliedenergistics2:certus_quartz_crystal>);

    # Certus Quartz Dust - AE2 (AE2, EE) 
    replacer.replace(<item:emendatusenigmatica:certus_quartz_dust>, <item:appliedenergistics2:certus_quartz_dust>);

    # Charged Certus Quartz - AE2 (AE2, EE)
    replacer.replace(<item:emendatusenigmatica:charged_certus_quartz_gem>, <item:appliedenergistics2:charged_certus_quartz_crystal>);

    # Copper Ingot - EE (C, EE, MEK, PR)
    replacer.replace(<item:create:copper_ingot>, <item:emendatusenigmatica:copper_ingot>);
    replacer.replace(<item:mekanism:ingot_copper>, <item:emendatusenigmatica:copper_ingot>);
    replacer.replace(<item:projectred-core:copper_ingot>, <item:emendatusenigmatica:copper_ingot>);

    # Lastly, run all the previous recipe replacements queued up
    replacer.execute();

    # --------------------------------------------------------------------------
    # Item hiding and removal
    # --------------------------------------------------------------------------
    # list of all the items we want to remove, as an array.
    # var itemsToRemove = [
        # wait, nothing here?
    # ] as IItemStack[];

    # defined in grey.zs
    # (itemsToRemove);

    # Items to hide, for various reasons
    # var itemsToHide = [
    #     <item:emendatusenigmatica:certus_quartz_dust>,
    #     <item:emendatusenigmatica:certus_quartz_gem>,
    # <item:emendatusenigmatica:charged_certus_quartz_gem>
    # ] as IItemStack[];

    # defined in grey.zs
    # gHideList(itemsToHide);

    # --------------------------------------------------------------------------
    # New recipes
    # --------------------------------------------------------------------------

    # Stopgap recipe until we no longer have EE variants of these ores in-world
    # AE2 provides no handler for charger recipes
    craftingTable.addShapeless("ee_certus_to_ae2", <item:appliedenergistics2:certus_quartz_crystal> * 1, [<item:emendatusenigmatica:certus_quartz_gem>]);
    craftingTable.addShapeless("ee_charged_certus_to_ae2", <item:appliedenergistics2:charged_certus_quartz_crystal> * 1, [<item:emendatusenigmatica:charged_certus_quartz_gem>]);
}