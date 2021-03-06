#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the invite process?
*/
private["_unit"];
disableSerialization;

if((lbCurSel 2632) == -1) exitWith {hint localize "STR_GNOTF_SelectPerson"};
_unit = call compile format["%1",getSelData(2632)];
if(isNull _unit) exitWith {}; //Bad unit?
if(_unit == player) exitWith {hint localize "STR_GNOTF_InviteSelf"};
if(!isNil {(group _unit) getVariable "gang_name"}) exitWith {hint localize "STR_D41_Already_GangMember"}; //Added

if(count(grpPlayer getVariable ["gang_members",8]) == (grpPlayer getVariable ["gang_maxMembers",8])) exitWith {hint localize "STR_GNOTF_MaxSlot"};
_grpSize = count(grpPlayer getVariable ["gang_members",8]);
_InviteCostsBase = 15000;
_InviteCosts = (_InviteCostsBase * _grpSize);

_action = [
	format[localize "STR_GNOTF_InvitePlayerMSG",_unit getVariable ["realname",name _unit],_InviteCosts],
	localize "STR_Gang_Invitation",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;


if(_action) then
	{
		_gang = group player;
		_gangBank = _gang getVariable "gang_bank";
		if(_gangBank < _InviteCosts)exitWith{hint format [localize "STR_GNOTF_GangBankMSGNotEnoughMoney",_gangBank,_InviteCosts]};
		
		[[profileName,grpPlayer],"life_fnc_gangInvite",_unit,false] call life_fnc_MP;
		hint format[localize "STR_GNOTF_InviteSent",_unit getVariable["realname",name _unit]];
		_gang setVariable["gang_bank",(_gangBank - _InviteCosts),true];
	}
	else
	{
		hint localize "STR_GNOTF_InviteCancel";
	};