/*
	File: fn_gathersalt.sqf
	Author: Distrikt41 - Dscha
	Description:
	Gathers Salz and reports it to DB?
*/
private["_CantDo","_sum","_LvL","_rndm","_count","_time","_Lcap","_type","_skill","_skillNeeded","_skillAdd","_hType","_GatherText","_GatheredText","_fnc_gather","_Karma"];
if(playerSide != civilian)exitWith{};
//_GangKarma = (group player) getVariable "gang_Karma";
//_MinKarma = 0;
//_CantDo = false;
//if(!isNil "_GangKarma")then{_GangKarma = call compile format["%1", _GangKarma];};
//if(isNil "_GangKarma")then{if(life_D41_Karma < _MinKarma)then{_CantDo = true;};}else{if(_GangKarma < _MinKarma)then{_CantDo = true;};};
//if(_CantDo)exitWith{hint format[localize "STR_D41_NichtGenugKarma",_MinKarma];};

_type = "D41_SalzRoh";
_skill = life_skillSalt;
_skillNeeded = {};
_skillAdd = {life_skillSalt = life_skillSalt + 1};
_hType = localize "STR_Item_Salt";
_Werkzeug = "D41_Schaufel";
_CheckWerkzeug = (_Werkzeug in (assignedItems player));
_GatherText = {titleText[format[localize "STR_D41_abbauen",_hType],"PLAIN"];};
_GatheredText = {titleText[format[localize "STR_D41_abgebaut",_rndm, _hType],"PLAIN"];};
_fnc_gather = {if(player canAdd _type) then {life_action_gather = true; call _GatherText; player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon"; sleep _time; if(alive player)then{call _skillAdd; call _GatheredText; for "_i" from 1 to _rndm do{player addMagazine _type; }; [_Karma,0] call life_fnc_D41_KSys; }; }else{hint localize "STR_NOTF_InvFull"; }; };
_Farbe = "9bbc57";


switch(true) do
{
	//Level 6
	case (_skill > 1249 && _CheckWerkzeug):					{_Karma = 0; _LvL = 6; _rndm = [8,9,10] call BIS_fnc_selectRandom;	_count = "8-10";	_time = 5;	_Lcap = "MAX";	call _fnc_gather; [ format [localize "STR_D41_SkillstufeMaxLvLErreicht",_LvL, _count, _time, _skill+1, _Lcap, _Farbe], SzoneXW, SzoneYH, 5, 0.25 ] spawn BIS_fnc_dynamicText;};
	case (_skill == 1249 && _CheckWerkzeug): 				{_Karma = 0; _LvL = 6; _rndm = [8,9,10] call BIS_fnc_selectRandom;	_count = "8-10";	_time = 5;	_Lcap = "MAX";	call _fnc_gather; [ format [localize "STR_D41_SkillstufeLvLUpMax",_LvL, _count, _time, _skill+1, _Lcap, _Farbe], SzoneXW, SzoneYH, 5, 0.25 ] spawn BIS_fnc_dynamicText;};
	//Level 5
	case (_skill > 849 && _skill < 1249 && _CheckWerkzeug):	{_Karma = 0; _LvL = 5; _rndm = [7,8,9] call BIS_fnc_selectRandom;	_count = "7-9"; 	_time = 5;	_Lcap = 1250;	call _fnc_gather; [ format [localize "STR_D41_Skillstufe",_LvL, _count, _time, _skill+1, _Lcap, _Farbe], SzoneXW, SzoneYH, 5, 0.25 ] spawn BIS_fnc_dynamicText;};
	case (_skill == 849 && _CheckWerkzeug):					{_Karma = 0; _LvL = 5; _rndm = [7,8,9] call BIS_fnc_selectRandom;	_count = "7-9"; 	_time = 5;	_Lcap = 1250;	call _fnc_gather; [ format [localize "STR_D41_SkillstufeLvLUp",_LvL, _count, _time, _skill+1, _Lcap, _Farbe], SzoneXW, SzoneYH, 5, 0.25 ] spawn BIS_fnc_dynamicText;};
	//Level 4
	case (_skill > 499 && _skill < 849 && _CheckWerkzeug):	{_Karma = 0; _LvL = 4; _rndm = [6,7,8] call BIS_fnc_selectRandom;	_count = "6-8"; 	_time = 5;	_Lcap = 850;	call _fnc_gather; [ format [localize "STR_D41_Skillstufe",_LvL, _count, _time, _skill+1, _Lcap, _Farbe], SzoneXW, SzoneYH, 5, 0.25 ] spawn BIS_fnc_dynamicText;};
	case (_skill == 499 && _CheckWerkzeug):					{_Karma = 0; _LvL = 4; _rndm = [6,7,8] call BIS_fnc_selectRandom;	_count = "6-8"; 	_time = 5;	_Lcap = 850;	call _fnc_gather; [ format [localize "STR_D41_SkillstufeLvLUp",_LvL, _count, _time, _skill+1, _Lcap, _Farbe], SzoneXW, SzoneYH, 5, 0.25 ] spawn BIS_fnc_dynamicText;};
	//Level 3
	case (_skill > 249 && _skill < 499 && _CheckWerkzeug):	{_Karma = 0; _LvL = 3; _rndm = [4,5,6] call BIS_fnc_selectRandom;	_count = "4-6"; 	_time = 5;	_Lcap = 500;	call _fnc_gather; [ format [localize "STR_D41_Skillstufe",_LvL, _count, _time, _skill+1, _Lcap, _Farbe], SzoneXW, SzoneYH, 5, 0.25 ] spawn BIS_fnc_dynamicText;};
	case (_skill == 249):									{_Karma = 0; _LvL = 3; _rndm = [4,5,6] call BIS_fnc_selectRandom;	_count = "4-6"; 	_time = 5;	_Lcap = 500;	call _fnc_gather; [ format [localize "STR_D41_SkillstufeLvLUp",_LvL, _count, _time, _skill+1, _Lcap, _Farbe], SzoneXW, SzoneYH, 5, 0.25 ] spawn BIS_fnc_dynamicText;};
	//Level 2
	case (_skill > 49 && _skill < 249):						{_Karma = 0; _LvL = 2; _rndm = [3,4,5] call BIS_fnc_selectRandom;	_count = "3-5"; 	_time = 5;	_Lcap = 250;	call _fnc_gather; [ format [localize "STR_D41_Skillstufe",_LvL, _count, _time, _skill+1, _Lcap, _Farbe], SzoneXW, SzoneYH, 5, 0.25 ] spawn BIS_fnc_dynamicText;};
	case (_skill == 49):									{_Karma = 0; _LvL = 2; _rndm = [3,4,5] call BIS_fnc_selectRandom;	_count = "3-5"; 	_time = 5;	_Lcap = 250;	call _fnc_gather; [ format [localize "STR_D41_SkillstufeLvLUp",_LvL, _count, _time, _skill+1, _Lcap, _Farbe], SzoneXW, SzoneYH, 5, 0.25 ] spawn BIS_fnc_dynamicText;};
	//Level1
	case (_skill < 49):										{_Karma = 0; _LvL = 1; _rndm = [1,2,3] call BIS_fnc_selectRandom;	_count = "1-3"; 	_time = 5;	_Lcap = 50;		call _fnc_gather; [ format [localize "STR_D41_Skillstufe",_LvL, _count, _time, _skill+1, _Lcap, _Farbe], SzoneXW, SzoneYH, 5, 0.25 ] spawn BIS_fnc_dynamicText;};
	default {hint localize "STR_D41_KeineSchaufel";};
};

life_action_gather = false;