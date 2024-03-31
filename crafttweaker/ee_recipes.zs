# Stopgap recipe until we no longer have EE variants of these ores in-world, AE2 provides no handler for charger recipes
function ee_recipes_main() as void
{
    craftingTable.addShapeless("ee_certus_to_ae2", <item:appliedenergistics2:certus_quartz_crystal> * 1, [<item:emendatusenigmatica:certus_quartz_gem>]);
    craftingTable.addShapeless("ee_charged_certus_to_ae2", <item:appliedenergistics2:charged_certus_quartz_crystal> * 1, [<item:emendatusenigmatica:charged_certus_quartz_gem>]);
}
