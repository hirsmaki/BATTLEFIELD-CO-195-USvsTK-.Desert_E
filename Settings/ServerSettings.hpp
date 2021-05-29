class TimeLimit 
{
	title = $STR_BF_MP_TIMELIMIT;
	values[] = {0,1800,3600,5400,7200,9000,18000};
	default = 3600;
	texts[] = {$STR_TIME_UNLIMITED,"00:30","01:00","01:30","02:00","02:30","05:00"};
};
class ScoreLimit
{ 
	title = $STR_BF_MP_SCORELIMIT;
	values[] = {0,100,250,500,750,1000,2500,5000};
	default = 100;
	texts[] = {$STR_TIME_UNLIMITED,"100","250","500","750","1000","2500","5000"};
}; 
class DrawDistance 
{
	title = $STR_BF_MP_DRAWDISTANCE;
	values[] = {500,1000,1500,2000,2500,3000,3500,4000,4500,5000};
	default = 1000;
	texts[] = {"500","1000","1500","2000","2500","3000","3500","4000","4500","5000"};
};
class GroundQuality
{
	title = $STR_BF_MP_GROUNDQUALITY;
	values[] = {50,25,12.5,6.25,3.125};
	default = 25;
	texts[] = {$STR_DAP_BF_OPTIONS_TQ_VLOW,$STR_DAP_BF_OPTIONS_TQ_LOW,$STR_DAP_BF_OPTIONS_TQ_MED,$STR_DAP_BF_OPTIONS_TQ_HIGH,$STR_DAP_BF_OPTIONS_TQ_VHIGH};
};
class EnablePlayersMarkers 
{
	title = $STR_BF_MP_ENABLEPLAYERMARKERS;
	values[] = {0,1,2,3};
	default = 3;
	texts[] = { $STR_BF_MP_ENABLEPM_NO,$STR_BF_MP_ENABLEPM_PLAYER, $STR_BF_MP_ENABLEPM_SQUAD,$STR_BF_MP_ENABLEPM_TEAM};
};
class EnableAI 
{
	title = $STR_BF_MP_ENABLEAI;
	values[] = {1,0};
	default = 1;
	texts[] = {$STR_BF_MP_ENABLE_TRUE,$STR_BF_MP_ENABLE_FALSE};
};
class UnlimitedAmmoAI 
{
	title = $STR_BF_MP_UNLIMITEDAMMO;
	values[] = {1,0};
	default = 1;
	texts[] = {$STR_BF_MP_ENABLE_TRUE,$STR_BF_MP_ENABLE_FALSE};
};
class EnableDefenceSquadSpawn 
{
	title = $STR_BF_MP_ENABLEDS;
	values[] = {1,0};
	default = 1;
	texts[] = {$STR_BF_MP_ENABLE_TRUE,$STR_BF_MP_ENABLE_FALSE};
};
class RespawnTime 
{
	title = $STR_BF_MP_RESPAWNTIME;
	values[] = {5,10,15,20,25,30,35,40,45,50,55,60};
	default = 15;
	texts[] = {"5","10","15","20","25","30","35","40","45","50","55","60"};
};
class MissionDate 
{
	title = $STR_BF_MP_MISSIONTIME;
	values[] = {00, 01, 02, 03, 04, 05, 06, 07, 08, 09, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23};
        default = 10;
        texts[] = {00:00, 01:00, 02:00, 03:00, 04:00, 05:00, 06:00, 07:00, 08:00, 09:00, 10:00, 11:00, 12:00, 13:00, 14:00, 15:00, 16:00, 17:00, 18:00, 19:00, 20:00, 21:00, 22:00, 23:00};
};