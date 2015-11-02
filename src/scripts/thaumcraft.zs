////Imports
import mods.botania.RuneAltar;
import mods.botania.ManaInfusion;
import mods.thaumcraft.Research;
import mods.thaumcraft.Crucible;
import mods.thaumcraft.Warp;
import mods.thaumcraft.Infusion;

////Value Declarations
//Plants
val saplingGreatwood = <Thaumcraft:blockCustomPlant>;
val saplingSilverwood = <Thaumcraft:blockCustomPlant:1>;
val shimmerleaf = <Thaumcraft:blockCustomPlant:2>;
val cinderpearl = <Thaumcraft:blockCustomPlant:3>;
val seedCinderPearl = <AgriCraft:seedCinderpearl>;
val seedShimmerLeaf = <AgriCraft:seedShimmerleaf>;

//other saplings
val saplingRowan = <witchery:witchsapling>;
val saplingHawthorn = <witchery:witchsapling:2>;
val saplingAlder = <witchery:witchsapling:1>;
val seedTreefyd = <witchery:ingredient:70>;

//magic crops essences
val essenceStrong = <magicalcrops:magicalcrops_MagicEssence:3>;
val essenceExtreme = <magicalcrops:magicalcrops_MagicEssence:4>;
val natureEssence = <magicalcrops:magicalcrops_CropEssence>;

//Devices
val table = <Thaumcraft:blockTable>;
val gwSlab = <Thaumcraft:blockCosmeticSlabWood>;
val gwPlank = <Thaumcraft:blockWoodenDevice:6>;
val totem = <Thaumcraft:blockCosmeticSolid>;
val obsidianTile = <Thaumcraft:blockCosmeticSolid:1>;
val thaumometer = <Thaumcraft:ItemThaumometer>;

//Materials
val oreAmber = <Thaumcraft:blockCustomOre:7>;
val oreCinnabar = <Thaumcraft:blockCustomOre>;
val amber = <Thaumcraft:ItemResource:6>;
val quicksilver = <Thaumcraft:ItemResource:3>;
val shards = <Thaumcraft:ItemShard:*>;
val thaumium = <Thaumcraft:ItemResource:2>;
val taintTendril = <Thaumcraft:ItemResource:12>;
val taintGoo = <Thaumcraft:ItemResource:11>;
val brainJar = <Thaumcraft:blockJar:1>;
val lodestone = <Thaumcraft:ItemCompassStone>;
val obelisk = <Thaumcraft:ItemEldritchObject:4>;
val voidBlock = <WitchingGadgets:WG_MetalDevice:7>;
val voidIngot = <Thaumcraft:ItemResource:16>;
val crimsonHood = <Thaumcraft:ItemHelmetCultistRobe>;
val crimsonHelm = <Thaumcraft:ItemHelmetCultistPlate>;
val crimsonRobe = <Thaumcraft:ItemChestplateCultistRobe>;
val crimsonChest = <Thaumcraft:ItemChestplateCultistPlate>;
val crimsonLegs = <Thaumcraft:ItemLeggingsCultistRobe>;
val crimsonGreaves = <Thaumcraft:ItemLeggingsCultistPlate>;
val crimsonBoots = <Thaumcraft:ItemBootsCultist>;
val crimsonBook = <Thaumcraft:ItemEldritchObject:1>;
val thaumonomicon = <Thaumcraft:ItemThaumonomicon>;

//ArcaneArteries
val arcaneBlade = <arcanearteries:arcanearteries thaumicKnife>.withTag({sacrifice: 0 as byte});
val thaumRazor = <arcanearteries:arcanearteries configDagger>.withTag({sacrifice: 0 as byte});
val sacrificialKnife = <AWWayofTime:sacrificialKnife>.withTag({sacrifice: 0 as byte});

//Other
val manaLens = <Botania:lens>;
val gold = <minecraft:gold_ingot>;
val sinisterNode = <Thaumcraft:BlockJarNodeItem>.withTag({nodetype: 2, RepairCost: 2, Aspects: [{amount: 6, key: "exanimis"}, {amount: 6, key: "mortuus"}, {amount: 6, key: "tenebrae"}], display: {Name: "Sinister Node in a Jar"}, nodemod: 1, nodeid: "0:581:64:-539"});
val jarredNode = <Thaumcraft:BlockJarNodeItem>;

//add TC sapling recipes
RuneAltar.addRecipe(saplingGreatwood, [seedTreefyd, essenceStrong, essenceStrong, essenceStrong, natureEssence, natureEssence, saplingRowan, saplingAlder, saplingHawthorn], 20000);
RuneAltar.addRecipe(saplingSilverwood, [seedTreefyd, essenceExtreme, essenceExtreme, essenceExtreme, natureEssence, natureEssence, saplingRowan, saplingAlder, saplingHawthorn, saplingGreatwood], 40000);

//Change Table recipe
recipes.remove(table);
recipes.addShaped(table, [[gwSlab, gwSlab, gwSlab], [gwPlank, null, gwPlank]]);

//Add Alchemy recipe to swap bewteen cinnabar and amber ores
ManaInfusion.addAlchemy(oreAmber, oreCinnabar, 8000);
ManaInfusion.addAlchemy(oreCinnabar, oreAmber, 8000);

//Add alchemy to swap between taint tendrils and goo
ManaInfusion.addAlchemy(taintTendril, taintGoo, 15000);
ManaInfusion.addAlchemy(taintGoo, taintTendril, 15000);

//Add alchemy to swap between crimson plate and robes
ManaInfusion.addAlchemy(crimsonHelm, crimsonHood, 30000);
ManaInfusion.addAlchemy(crimsonHood, crimsonHelm, 30000);
ManaInfusion.addAlchemy(crimsonRobe, crimsonChest, 30000);
ManaInfusion.addAlchemy(crimsonChest, crimsonRobe, 30000);
ManaInfusion.addAlchemy(crimsonLegs, crimsonGreaves, 30000);
ManaInfusion.addAlchemy(crimsonGreaves, crimsonLegs, 30000);

//Force refresh the table recipe in the thaumonomicon
Research.refreshResearchRecipe("TABLE");

//remove lead transmutation research
Research.orphanResearch("TRANSLEAD");
Research.removeResearch("TRANSLEAD");

//change thaumometer recipe
recipes.remove(thaumometer);
recipes.addShaped(thaumometer, [[null, shards, null], [gold, manaLens, gold], [null, shards, null]]);
Research.refreshResearchRecipe("THAUMOMETER");

//Add crucible recipe for obsidian totems
Crucible.addRecipe("TOTEM", totem, obsidianTile, "alienis 8, tenebrae 8, mortuus 8, terra 12, auram 6, exanimis 6");

//Add research for new totem recipe
Research.addResearch("TOTEM", "ALCHEMY", "alienis 12, tenebrae 12", 2, -3, 4, totem);
game.setLocalization("en_US", "tc.research_name.TOTEM", "Obsidian Totems");
game.setLocalization("en_US", "tc.research_text.TOTEM", "[RG]Structurally Sound");
Research.addPrereq("TOTEM", "CRUCIBLE", false);
Research.addPage("TOTEM", "totem.research_page.one");
game.setLocalization("en_US", "totem.research_page.one", "You recall encountering strange pillars of obsidian tiles which housed only the most sinister of aura nodes. So sinister in fact, that they would warp the obsidian, giving it some very peculiar properties. <BR> Now, however, you think you've found a way to recreate these obsidian totems with your crucible.");
Research.addCruciblePage("TOTEM", totem);
Warp.addToResearch("TOTEM", 4);
Warp.addToItem(totem, 4);

//Add recipes for Cinderpearl and Shimmerleaf
Crucible.addRecipe("LEAFY", seedCinderPearl, amber, "herba 4, ignis 2, praecantatio 2");
Crucible.addRecipe("LEAFY", seedShimmerLeaf, quicksilver, "herba 4, permutatio 2, praecantatio 2");
//add associated research
Research.addResearch("LEAFY", "ALCHEMY", "herba 6, praecantatio 4", -2, -2, 2, cinderpearl);
game.setLocalization("en_US", "tc.research_name.LEAFY", "Thaumic Flowers");
game.setLocalization("en_US", "tc.research_text.LEAFY", "[RG]Delicate Blooms");
Research.addPrereq("LEAFY", "CRUCIBLE", false);
Research.addPage("LEAFY", "leafy.research_page.info");
game.setLocalization("en_US", "leafy.research_page.info", "Small delicate flowers coveted by Thaumaturges once could be found all around the world. Now you think you've found a means to recreate them.");
Research.addCruciblePage("LEAFY", seedCinderPearl);
Research.addCruciblePage("LEAFY", seedShimmerLeaf);

////Arcane arteries dagger swapsie
//Infusion recipe for thaum razor (config dagger)
Infusion.addRecipe("DAGGER", sacrificialKnife, [thaumium, thaumium], "praecantatio 10, victus 16", thaumRazor, 3);
//Research
Research.clearPages("DAGGER");
Research.addPage("DAGGER", "dagger.research_page.info");
game.setLocalization("en_US", "dagger.research_page.info", "Collecting blood used to be a chore, but not anymore. Your knowledge of thaumaturgy has led you to discover the ability to make your time at the Blood Altar a little shorter.");
Research.addInfusionPage("DAGGER", thaumRazor);
Warp.addToResearch("DAGGER", 1);
Warp.addToItem(thaumRazor, 1);
//Remove infusion recipe for arcane blade
Infusion.removeRecipe(arcaneBlade);

//Sinister Node infusion
Infusion.addRecipe("SINISTERNODE", jarredNode, [totem, obsidianTile, brainJar, totem, obsidianTile, totem, obsidianTile, lodestone, totem, obsidianTile], "exanimis 16, mortuus 16, tenebrae 16", sinisterNode, 6);
//Sinister Node Research
Research.addResearch("SINISTERNODE", "ARTIFICE", "mortuus 6, tenebrae 6, exanimis 6", -4, 11, 6, sinisterNode);
game.setLocalization("en_US", "tc.research_name.SINISTERNODE", "Sinister Nodes");
game.setLocalization("en_US", "tc.research_text.SINISTERNODE", "[RG]Darkened Aura");
Research.addPrereq("SINISTERNODE", "TOTEM", true);
Research.addPrereq("SINISTERNODE", "SINSTONE", true);
Research.addPrereq("SINISTERNODE", "NODEJAR", true);
Research.addPrereq("SINISTERNODE", "JARBRAIN", false);
Research.addPage("SINISTERNODE", "sinisternode.research_page.info");
game.setLocalization("en_US", "sinisternode.research_page.info", "A common motif with the old obsidian totems was the presence of a sinister node, dark enough to corrupt the world around around it. Maybe there is something to be learned from these, and recreating them syntheticially may prove insightful.");
Research.addInfusionPage("SINISTERNODE", sinisterNode);
Warp.addToResearch("SINISTERNODE", 3);

//Eldritch Obelisk infusion
Infusion.addRecipe("BUILDOBELISK", voidBlock, [voidIngot, crimsonHelm, crimsonBook, totem, voidIngot, crimsonHood, crimsonBook, totem], "alienis 32, tenebrae 32, praecantatio 16, vacuos 16", obelisk, 8);
//Obelisk Research
Research.addResearch("BUILDOBELISK", "ELDRITCH", "alienis 12, tenebrae 12, vacuos 12", -4, -1, 8, obelisk);
game.setLocalization("en_US", "tc.research_name.BUILDOBELISK", "Eldritch Obelisks");
game.setLocalization("en_US", "tc.research_text.BUILDOBELISK", "[RG]Watch where you tread");
Research.addPrereq("BUILDOBELISK", "CRIMSONBOOK", false);
Research.addPrereq("BUILDOBELISK", "VOIDMETAL", true);
Research.addPage("BUILDOBELISK", "buildobelisk.research_page.info");
game.setLocalization("en_US", "buildobelisk.research_page.info", "It's coming back to you now. The so called crimson cult was often found clustered around strange obelisks in the distant past. You don't know what might have happened to these structures or the cultists now; perhaps one may be found if you were to wander far enough, but its hard to say. <LINE>You can however vaguely remember what they were like, and by applying your knowledge of thaumatrugy, may just be able to recreate them. You feel like you're missing the most sinister part of the construction necessary for it to function however...");
Research.addInfusionPage("BUILDOBELISK", obelisk);
Warp.addToResearch("BUILDOBELISK", 4);
Warp.addToItem(obelisk, 4);

//Crimson book infusion
Infusion.addRecipe("CRIMSONBOOK", thaumonomicon, [voidIngot, crimsonHelm, crimsonChest, crimsonGreaves, crimsonBoots, crimsonLegs, crimsonRobe, crimsonHood], "cognitio 16, sensus 16, alienis 16, tenebrae 16", crimsonBook, 5);
//Crimson book research
Research.addResearch("CRIMSONBOOK", "ELDRITCH", "cognitio 6, alienis 6, tenebrae 6", -2, -2, 4, crimsonBook);
game.setLocalization("en_US", "tc.research_name.CRIMSONBOOK", "Occult Knowledge");
game.setLocalization("en_US", "tc.research_text.CRIMSONBOOK", "[RG]Do you really want to know?");
Research.addPrereq("CRIMSONBOOK", "ELDRITCHMAJOR", false);
Research.addPage("CRIMSONBOOK", "crimsonbook.research_page.info");
game.setLocalization("en_US", "crimsonbook.research_page.info", "Infusing Chain armour with blood transformed it into almost ceremonious armour. More curiously this triggered a memory from before of a dark cult that instilled terror across the land. Dare you try and recover their knowledge which was lost?");
Research.addInfusionPage("CRIMSONBOOK", crimsonBook);
Warp.addToResearch("CRIMSONBOOK", 3);
Warp.addToItem(crimsonBook, 3);