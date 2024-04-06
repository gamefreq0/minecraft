import crafttweaker.api.recipe.Replacer;

function pack_unification_main() as void
{
    # --------------------------------------------------------------------------
    # Recipe Replacements
    # --------------------------------------------------------------------------

    # First, create replacer
    var replacer as Replacer = Replacer.forEverything();

    # EE Certus Quartz --> AE2 Certus Quartz
    replacer.replace(<item:emendatusenigmatica:certus_quartz_gem>, <item:appliedenergistics2:certus_quartz_crystal>);

    # EE Charged Certus Quartz --> AE Charged Certus Quartz
    replacer.replace(<item:emendatusenigmatica:charged_certus_quartz_gem>, <item:appliedenergistics2:charged_certus_quartz_crystal>);

    # Lastly, run all the previous recipe replacements queued up
    replacer.execute();

    # --------------------------------------------------------------------------
    # New recipes
    # --------------------------------------------------------------------------

    # Stopgap recipe until we no longer have EE variants of these ores in-world
    # AE2 provides no handler for charger recipes
    craftingTable.addShapeless("ee_certus_to_ae2", <item:appliedenergistics2:certus_quartz_crystal> * 1, [<item:emendatusenigmatica:certus_quartz_gem>]);
    craftingTable.addShapeless("ee_charged_certus_to_ae2", <item:appliedenergistics2:charged_certus_quartz_crystal> * 1, [<item:emendatusenigmatica:charged_certus_quartz_gem>]);
}