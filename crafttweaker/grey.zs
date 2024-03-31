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
        
        # botania
        <recipetype:botania:elven_trade>,
        <recipetype:botania:mana_infusion>,
        <recipetype:botania:petal_apothecary>,
        <recipetype:botania:runic_altar>,

        # Create
        <recipetype:create:compacting>,
        <recipetype:create:crushing>,
        <recipetype:create:cutting>,
        <recipetype:create:emptying>,
        <recipetype:create:filling>,
        <recipetype:create:mechanical_crafting>,
        <recipetype:create:milling>,
        <recipetype:create:mixing>,
        <recipetype:create:pressing>,
        <recipetype:create:sandpaper_polishing>,
        <recipetype:create:splashing>,

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
                println("                leftover: " + _ingredient.getRemainingItem().registryName.toString());
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
