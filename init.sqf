setDate [2039,6,6,0,0];

// FLARE FIX - recommended for vanilla missions and assets only, with mods you might have problems
// flare intensity, replace 30 with desired value
al_flare_intensity = 30;
publicvariable "al_flare_intensity";
// flare range, replace 500 with desired value
al_flare_range = 200;
publicvariable "al_flare_range";
al_mortar_flare_intensity = 100;
publicvariable "al_mortar_flare_intensity";
al_mortar_flare_range = 450;
publicvariable "al_mortar_flare_range";
// If you want to use FLARE FIX do not edit or remove lines bellow
player addEventHandler ["Fired",{private ["_al_flare"]; _al_flare = _this select 6;[[_al_flare],"AL_flare_fix\al_flare_enhance.sqf"] remoteExec ["execVM",0,true]}];
// FOR vanilla mortars place this line inside their init field.
// this addEventHandler ["Fired",{private ["_al_flare"]; _al_flare = _this select 6;[[_al_flare],"AL_flare_fix\al_flare_enhance.sqf"] remoteExec ["execVM",0,true]}];
// ^^^^^^^^^^ END FLARE fix ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

//Intro Text and Music
waitUntil {!isNull player};
[1,"BLACK",8,1,"LeadTrack01_F_Tacops"] spawn BIS_fnc_fadeEffect;
sleep 2;
_currentTime = [dayTime] call BIS_fnc_timeToString;
[["USS Freedom",4,1],["Horizon Islands",4,1],["June 6th, 2039",4,1,5]] spawn BIS_fnc_EXP_camp_SITREP;
sleep 10;
//playMusic "AmbientTrack01a_F_Tacops";
