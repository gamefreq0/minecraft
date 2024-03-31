# Yes, this is the master.
import crafttweaker.api.item.IIngredient;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.recipe.Replacer;
import crafttweaker.api.recipes.WrapperRecipe;
import crafttweaker.api.registries.IRecipeManager;
import crafttweaker.api.util.text.MCTextComponent;

import mods.botania.ElvenTrade;
import mods.botania.ManaInfusion;
import mods.botania.PetalApothecary;
import mods.botania.PureDaisy;
import mods.botania.RuneAltar;

function gRecipeManagers() as IRecipeManager[]
{
    var ret as IRecipeManager[] = [
        # AE2
        <recipetype:appliedenergistics2:grinder>,
        <recipetype:appliedenergistics2:inscriber>,
        <recipetype:appliedenergistics2:entropy>,

        # botania
        <recipetype:botania:brew>,
        <recipetype:botania:elven_trade>,
        <recipetype:botania:mana_infusion>,
        <recipetype:botania:petal_apothecary>,
        # <recipetype:botania:pure_daisy>,       # Have to work with by hand
        <recipetype:botania:runic_altar>,
        <recipetype:botania:terra_plate>,

        # Chisels and Bits
        <recipetype:chiselsandbits:modification_table>,

        # Create
        <recipetype:create:basin>,
        <recipetype:create:compacting>,
        <recipetype:create:conversion>,
        <recipetype:create:crushing>,
        <recipetype:create:cutting>,
        <recipetype:create:deploying>,
        <recipetype:create:emptying>,
        <recipetype:create:filling>,
        <recipetype:create:mechanical_crafting>,
        <recipetype:create:milling>,
        <recipetype:create:mixing>,
        <recipetype:create:pressing>,
        <recipetype:create:sandpaper_polishing>,
        <recipetype:create:sequenced_assembly>,
        <recipetype:create:splashing>,

        # Create Additions
        <recipetype:createaddition:rolling>,
        <recipetype:createaddition:crude_burning>,

        # Doomweapons
        <recipetype:doom:gun_table>,
        <recipetype:doom:guns>,

        # Environmental
        <recipetype:environmental:baking>,
        <recipetype:environmental:sawing>,

        # Mekanism
        # <recipetype:mekanism:activating>,
        #  <recipetype:mekanism:centrifuging>,
        # <recipetype:mekanism:chemical_infusing>,
        # <recipetype:mekanism:compressing>,
        # <recipetype:mekanism:combining>,
        # <recipetype:mekanism:crushing>,
        # <recipetype:mekanism:crystallizing>,
        # <recipetype:mekanism:dissolution>,
        # <recipetype:mekanism:energy_conversion>,
        # <recipetype:mekanism:enriching>,
        # <recipetype:mekanism:evaporating>,
        # <recipetype:mekanism:gas_conversion>,
        # <recipetype:mekanism:infusion_conversion>,
        # <recipetype:mekanism:injecting>,
        # <recipetype:mekanism:metallurgic_infusing>,
        # <recipetype:mekanism:nucleosynthesizing>,
        # <recipetype:mekanism:oxidizing>,
        # <recipetype:mekanism:painting>,
        # <recipetype:mekanism:pigment_extracting>,
        # <recipetype:mekanism:pigment_mixing>,
        # <recipetype:mekanism:purifying>,
        # <recipetype:mekanism:reaction>,
        # <recipetype:mekanism:rotary>,
        # <recipetype:mekanism:sawing>,
        # <recipetype:mekanism:separating>,
        # <recipetype:mekanism:smelting>,
        # <recipetype:mekanism:washing>,

        # Paraglider
        <recipetype:paraglider:statue_bargain>,

        # Powah
        <recipetype:powah:energizing>,

        # VehicleMod
        <recipetype:vehicle:crafting>,
        <recipetype:vehicle:fluid_extractor>,
        <recipetype:vehicle:fluid_mixer>,

        # vanilla
        <recipetype:minecraft:blasting>,
        <recipetype:minecraft:campfire_cooking>,
        <recipetype:minecraft:crafting>,
        <recipetype:minecraft:smelting>,
        <recipetype:minecraft:smithing>,
        <recipetype:minecraft:smoking>,
        <recipetype:minecraft:stonecutting>
    ];

    return ret;
}

function gRemove(_item as IItemStack) as void
{
    var _managers as IRecipeManager[] = gRecipeManagers();

    for _manager in _managers
    {
        _manager.removeRecipe(_item);
    }
}

function gReplaceQueue(_from as IItemStack, _to as IItemStack) as void
{
    Replacer.forEverything().replace(_from,_to);
}

function gReplaceCommit() as void
{
    Replacer.forEverything().execute();
}

function gRemoveList(_items as IItemStack[]) as void
{
    for _item in _items
    {
        gRemove(_item);
    }
}

function gHide(_item as IItemStack) as void
{
    # vanilla
    # ... no longer hide in creative tabs...

    # JEI
    mods.jei.JEI.hideItem(_item);
}

function gHideList(_items as IItemStack[]) as void
{
    for _item in _items
    {
        gHide(_item);
    }
}

function gRemoveAndHide(_item as IItemStack) as void
{
    gRemove(_item);
    gHide(_item);
}

function gRemoveAndHideList(_items as IItemStack[]) as void
{
    for _item in _items
    {
        gRemoveAndHide(_item);
    }
}

function gDescriptiveText(_item as IItemStack, _text as string) as void
{
    var _mcText as MCTextComponent = MCTextComponent.createStringTextComponent(_text);
    _item.addTooltip(_mcText);
}

function gFlavorText(_item as IItemStack, _text as string) as void
{
    var _mcText as MCTextComponent = MCTextComponent.createStringTextComponent(_text);
    _item.addTooltip(_mcText);
}

function gBreakText(_item as IItemStack) as void
{
    var _mcText as MCTextComponent = MCTextComponent.createStringTextComponent("");
    _item.addTooltip(_mcText);
}

function gDumpRecipes() as void
{
    println("recipes:");

    var _managers as IRecipeManager[] = gRecipeManagers();

    for _manager in _managers
    {
        var _recipes as stdlib.List<WrapperRecipe> = _manager.getAllRecipes();
        
        for _recipe in _recipes
        {
            println("    -");

            println("        ingredients:");
            for _ingredient in _recipe.ingredients
            {
                println("            -");
                println("                bep: " + _ingredient.commandString);
                println("                items:");
                for _ingredientItem in _ingredient.items
                {
                    println("                    - " + _ingredientItem.registryName.toString());
                }
            }

            println("        output:");
            println("            name: " + _recipe.output.registryName.toString());
            println("            count: " + _recipe.output.amount);
        }
    }
}
