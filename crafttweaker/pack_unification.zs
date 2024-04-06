function pack_unification_main() as void
{
    # EE Certus Quartz --> AE2 Certus Quartz
    gReplaceQueue(<item:emendatusenigmatica:certus_quartz_gem>, <item:appliedenergistics2:certus_quartz_crystal>);

    # EE Charged Certus Quartz --> AE Charged Certus Quartz
    gReplaceQueue(<item:emendatusenigmatica:charged_certus_quartz_gem>, <item:appliedenergistics2:charged_certus_quartz_crystal>);

    # Lastly, run all the previous recipe replacements
    gReplaceCommit();
}