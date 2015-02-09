////Imports
import mods.botania.ManaInfusion;

////Variable declarations
//EBXL
val mcAcacia = <minecraft:sapling:4>;
val crackedSand = <ExtrabiomesXL:terrain_blocks2>;
val autumnUmber = <ExtrabiomesXL:saplings_1>;
val autumnGoldenrod = <ExtrabiomesXL:saplings_1:1>;
val autumnVermillion = <ExtrabiomesXL:saplings_1:2>;
val autumnCitrine = <ExtrabiomesXL:saplings_1:3>;
val fir = <ExtrabiomesXL:saplings_1:4>;
val ebxlRedwood = <ExtrabiomesXL:saplings_1:5>;
val ebxlAcacia = <ExtrabiomesXL:saplings_1:6>;
val cypress = <ExtrabiomesXL:saplings_1:7>;
val cypressBald = <ExtrabiomesXL:saplings_2>;
val japMaple = <ExtrabiomesXL:saplings_2:1>;
val japMapleShrub = <ExtrabiomesXL:saplings_2:2>;
val rainbowEucalyptus = <ExtrabiomesXL:saplings_2:3>;
val ebxlSakura = <ExtrabiomesXL:saplings_2:4>;
//Natura
val mcDarkOak = <minecraft:sapling:5>;
val netherSoil = <Natura:soil.tainted>;
val natRedwood = <Natura:florasapling>;
val eucalyptus = <Natura:florasapling:1>;
val hopseed = <Natura:florasapling:2>;
val natSakura = <Natura:florasapling:3>;
val ghostwood = <Natura:florasapling:4>;
val bloodwood = <Natura:florasapling:5>;
val darkwood = <Natura:florasapling:6>;
val fusewood = <Natura:florasapling:7>;
val maple = <Natura:Rare Sapling>;
val silverbell = <Natura:Rare Sapling:1>;
val amaranth = <Natura:Rare Sapling:2>;
val tigerwood = <Natura:Rare Sapling:3>;
val willow = <Natura:Rare Sapling:4>;

//add recipe to make ebxl sapling
recipes.addShapeless(ebxlAcacia, [mcAcacia, crackedSand]);

//Alchemy for EBXL saplings
ManaInfusion.addAlchemy(autumnUmber, ebxlSakura, 5000);
ManaInfusion.addAlchemy(autumnGoldenrod, autumnUmber, 5000);
ManaInfusion.addAlchemy(autumnVermillion, autumnGoldenrod, 5000);
ManaInfusion.addAlchemy(autumnCitrine, autumnVermillion, 5000);
ManaInfusion.addAlchemy(fir, autumnCitrine, 5000);
ManaInfusion.addAlchemy(ebxlRedwood, fir, 5000);
ManaInfusion.addAlchemy(ebxlAcacia, ebxlRedwood, 5000);
ManaInfusion.addAlchemy(cypress, ebxlAcacia, 5000);
ManaInfusion.addAlchemy(cypressBald, cypress, 5000);
ManaInfusion.addAlchemy(japMaple, cypressBald, 5000);
ManaInfusion.addAlchemy(japMapleShrub, japMaple, 5000);
ManaInfusion.addAlchemy(rainbowEucalyptus, japMapleShrub, 5000);
ManaInfusion.addAlchemy(ebxlSakura, rainbowEucalyptus, 5000);

//add recipe to make natura sapling
recipes.addShapeless(darkwood, [mcDarkOak, netherSoil]);

//Alchemy for natura saplings
ManaInfusion.addAlchemy(natRedwood, willow, 5000);
ManaInfusion.addAlchemy(eucalyptus, natRedwood, 5000);
ManaInfusion.addAlchemy(hopseed, eucalyptus, 5000);
ManaInfusion.addAlchemy(natSakura, hopseed, 5000);
ManaInfusion.addAlchemy(ghostwood, natSakura, 5000);
ManaInfusion.addAlchemy(bloodwood, ghostwood, 30000);
ManaInfusion.addAlchemy(darkwood, bloodwood, 5000);
ManaInfusion.addAlchemy(fusewood, darkwood, 5000);
ManaInfusion.addAlchemy(maple, fusewood, 5000);
ManaInfusion.addAlchemy(silverbell, maple, 5000);
ManaInfusion.addAlchemy(amaranth, silverbell, 5000);
ManaInfusion.addAlchemy(tigerwood, amaranth, 5000);
ManaInfusion.addAlchemy(willow, tigerwood, 5000);