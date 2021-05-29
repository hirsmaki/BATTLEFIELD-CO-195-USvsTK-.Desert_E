EASTWEAPONS=[["AKS_74_U",50],["FN_FAL",50],["M16A2GL",50],["AK_47_M",50],["AK_74",50],["AK_74_GL",50],["PK",5],["RPK_74",5],["KSVK",5],["SVD",5],["SVD_des_EP1",5],["SVD_NSPU_EP1",5],["MetisLauncher",5],["RPG7V",5],["RPG18",5],["igla",5],["Makarov",10],["MakarovSD",10],["LaserDesignator",5],["Binocular_Vector",10],["Binocular",50],["NVGoggles",50]];
EASTMAGAZINES=[["20Rnd_762x51_FNFAL",500],["30Rnd_556x45_Stanag",500],["30Rnd_762x39_AK47",500],["30Rnd_545x39_AK",500],["100Rnd_762x54_PK",100],["75Rnd_545x39_RPK",100],["5Rnd_127x108_KSVK",50],["10Rnd_762x54_SVD",50],["AT13",5],["PG7VL",10],["PG7VR",5],["igla",5],["8Rnd_9x18_Makarov",50],["8Rnd_9x18_MakarovSD",50],["1Rnd_HE_GP25",50],["FlareWhite_GP25",50],["FlareRed_GP25",50],["HandGrenade_East",100],["SmokeShell",50],["SmokeShellGreen",50],["SmokeShellRed",50],["MineE",10],["PipeBomb",10],["LaserBatteries",10]];

WESTWEAPONS=[["MP5A5",10],["MP5SD",10],["M4A1_Aim",50],["M4A3_CCO_EP1",10],["M4A1_RCO_GL",10],["M4A3_RCO_GL_EP1",10],["M4A1_HWS_GL",10],["M16A4",50],["m16a4_acg",10],["M16A4_GL",10],["M16A4_acg_gl",10],["SCAR_L_CQC_Holo",10],["SCAR_L_CQC_EGLM_Holo",10],["SCAR_H_CQC_CCO_SD",10],["SCAR_H_STD_EGLM_Spect",10],["m240_scoped_EP1",5],["M249",5],["MK_48",5],["Mk_48_DES_EP1",5],["M107",5],["M24",5],["M24_des_EP1",5],["M110_NVG_EP1",5],["DMR",5],["Javelin",5],["SMAW",5],["M136",5],["Stinger",5],["Colt1911",10],["M9",10],["M9SD",10],["LaserDesignator",5],["Binocular_Vector",10],["Binocular",50],["NVGoggles",50]];
WESTMAGAZINES=[["30Rnd_9x19_MP5",100],["30Rnd_9x19_MP5SD",100],["30Rnd_556x45_Stanag",500],["20rnd_762x51_B_SCAR",100],["20rnd_762x51_SB_SCAR",100],["100Rnd_762x51_M240",100],["100Rnd_556x45_M249",100],["10Rnd_127x99_m107",50],["5Rnd_762x51_M24",50],["20Rnd_762x51_DMR",50],["SMAW_HEAA",10],["SMAW_HEDP",5],["Stinger",5],["7Rnd_45ACP_1911",50],["15Rnd_9x19_M9",50],["15Rnd_9x19_M9SD",50],["1Rnd_HE_M203",50],["FlareWhite_M203",50],["FlareRed_M203",50],["HandGrenade_West",100],["SmokeShell",50],["SmokeShellGreen",50],["SmokeShellRed",50],["Mine",10],["PipeBomb",10],["LaserBatteries",10]];

if (isClass(configFile>>"CfgPatches">>"ace_main")) then 
{

	WESTWEAPONS = WESTWEAPONS + [["ACE_Javelin_CLU",5]];
	WESTWEAPONS = WESTWEAPONS + [["ACE_ParachuteRoundPack",10],["ACE_Earplugs",50],["ACE_GlassesTactical",50],["ACE_GlassesLHD_glasses",50],["ACE_GlassesGasMask_US",50],["ACE_GlassesBalaklava",50],["ACE_GlassesBalaklavaOlive",50],["ACE_GlassesBalaklavaGray",50],["ACE_Kestrel4500",10],["ACE_SpottingScope",10]];
	EASTWEAPONS = EASTWEAPONS + [["ACE_ParachuteRoundPack",10],["ACE_Earplugs",50],["ACE_GlassesTactical",50],["ACE_GlassesLHD_glasses",50],["ACE_GlassesGasMask_RU",50],["ACE_GlassesBalaklava",50],["ACE_GlassesBalaklavaOlive",50],["ACE_GlassesBalaklavaGray",50],["ACE_Kestrel4500",10],["ACE_SpottingScope",10]];

}
else
{
	EASTMAGAZINES = EASTMAGAZINES + [["RPG18",10]];
	WESTMAGAZINES = WESTMAGAZINES + [["M136",10]];
	WESTMAGAZINES = WESTMAGAZINES + [["Javelin",5]];
};