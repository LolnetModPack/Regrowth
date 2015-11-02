////imports
import mods.tconstruct.Smeltery;
import mods.tconstruct.Casting;
import minetweaker.item.IItemStack;

////variable declarations
val blockRutile = <Mariculture:metals:2>;
val blockTitanium = <Mariculture:metals:4>;
val nuggetRutile = <Mariculture:materials:37>;
val nuggetTitanium = <Mariculture:materials:36>;
val expDrop = <magicalcrops:magicalcrops_ExperienceDrop>;
val essenceBerry = <TConstruct:oreBerries:5>;
val waterEssence = <magicalcrops:magicalcrops_ElementEssence>;
val fireEssence = <magicalcrops:magicalcrops_ElementEssence:1>;
val earthEssence = <magicalcrops:magicalcrops_ElementEssence:2>;
val airEssence = <magicalcrops:magicalcrops_ElementEssence:3>;
val oreRutile = <Mariculture:rocks:3>;
val redSand = <minecraft:sand:1>;
//Titanium Tool parts
val tAxehead = <Mariculture:titanium.axe.head>;
val tBoard = <Mariculture:titanium.battlesign.head>;
val tPan = <Mariculture:titanium.frypan.head>;
val tPickhead = <Mariculture:titanium.pickaxe.head>;
val tShovelhead = <Mariculture:titanium.shovel.head>;
val tSwordBlade = <Mariculture:titanium.sword.blade>;
val partTitanium1 = [tAxehead, tBoard, tPan, tPickhead, tShovelhead, tSwordBlade] as IItemStack[];

val tBinding = <Mariculture:titanium.binding>;
val tChiselhead = <Mariculture:titanium.chisel.head>;
val tCrossbar = <Mariculture:titanium.crossbar>;
val tKnifeblade = <Mariculture:titanium.knife.blade>;
val tWideGuard = <Mariculture:titanium.large.guard>;
val tHandGuard = <Mariculture:titanium.medium.guard>;
val tToolRod = <Mariculture:titanium.tool.rod>;
val partTitaniumhalf = [tBinding, tChiselhead, tCrossbar, tKnifeblade, tWideGuard, tHandGuard, tToolRod] as IItemStack[];

val tFullguard = <Mariculture:titanium.full.guard>;
val tToughBinding = <Mariculture:titanium.tough.binding>;
val tToughRod = <Mariculture:titanium.tough.rod>;
val partTitanium3 = [tFullguard, tToughBinding, tToughRod] as IItemStack[];

val tExcavatorhead = <Mariculture:titanium.excavator.head>;
val tHammerhead = <Mariculture:titanium.hammer.head>;
val tLargeBlade = <Mariculture:titanium.large.sword.blade>;
val tLargePlate = <Mariculture:titanium.large.plate>;
val tBroadAxehead = <Mariculture:titanium.lumberaxe.head>;
val tScythehead = <Mariculture:titanium.scythe.head>;
val partTitanium8 = [tExcavatorhead, tHammerhead, tLargeBlade, tLargePlate, tBroadAxehead, tScythehead] as IItemStack[];

//Casts
val castNugget = <TConstruct:metalPattern:27>;

//Add Melting to liquid glass from red sand
Smeltery.addMelting(redSand, <liquid:glass.molten> * 1000, 500, redSand);

//Change melting recipes for Chainmail to make iron rather than steel
Smeltery.removeMelting(<minecraft:chainmail_boots>);
Smeltery.removeMelting(<minecraft:chainmail_chestplate>);
Smeltery.removeMelting(<minecraft:chainmail_helmet>);
Smeltery.removeMelting(<minecraft:chainmail_leggings>);
Smeltery.addMelting(<minecraft:chainmail_boots>, <liquid:iron.molten> * 128, 800, <minecraft:iron_block>);
Smeltery.addMelting(<minecraft:chainmail_chestplate>, <liquid:iron.molten> * 256, 800, <minecraft:iron_block>);
Smeltery.addMelting(<minecraft:chainmail_helmet>, <liquid:iron.molten> * 160, 800, <minecraft:iron_block>);
Smeltery.addMelting(<minecraft:chainmail_leggings>, <liquid:iron.molten> * 224, 800, <minecraft:iron_block>);

//add block of impure titanium casting recipe
Casting.addBasinRecipe(blockRutile, <liquid:rutile.molten> * 1296, null, false, 20);
//add smeltery melting recipe for rutile ore
Smeltery.addMelting(oreRutile, <liquid:rutile.molten> * 288, 800, oreRutile);
//add casting recipe for rutile nugget
Casting.addTableRecipe(nuggetRutile, <liquid:rutile.molten> * 16, castNugget, false, 20);
//add casting recipe for titanium nugget
Casting.addTableRecipe(nuggetTitanium, <liquid:titanium.molten> * 16, castNugget, false, 20);

//Add melting down of Titanium tool parts
for part1 in partTitanium1 {
	Smeltery.addMelting(part1, <liquid:titanium.molten> * 144, 800, blockTitanium);
}
for parthalf in partTitaniumhalf {
	Smeltery.addMelting(parthalf, <liquid:titanium.molten> * 72, 800, blockTitanium);
}
for part3 in partTitanium3 {
	Smeltery.addMelting(part3, <liquid:titanium.molten> * 432, 800, blockTitanium);
}
for part8 in partTitanium8 {
	Smeltery.addMelting(part8, <liquid:titanium.molten> * 1152, 800, blockTitanium);
}

//let xp drops and essence berries be melted down to liquid XP
Smeltery.addMelting(expDrop, <liquid:xp> * 40, 400, <magicalcrops:EssenceBlocks:11>);
Smeltery.addMelting(essenceBerry, <liquid:xp> * 15, 300, <magicalcrops:EssenceBlocks:11>);

//Add melting of elemental essences to liquids for fun
Smeltery.addMelting(fireEssence, <liquid:lava> * 250, 400, <minecraft:netherrack>);
Smeltery.addMelting(waterEssence, <liquid:water> * 250, 200, <minecraft:packed_ice>);
Smeltery.addMelting(earthEssence, <liquid:dirt> * 250, 300, <minecraft:dirt>);
Smeltery.addMelting(airEssence, <liquid:steam> * 250, 100, <Natura:Cloud>);