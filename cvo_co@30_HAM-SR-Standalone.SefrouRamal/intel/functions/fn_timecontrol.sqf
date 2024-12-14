/*
* Author: Zorn
* function reads current ingame daytime, accelerates time until target time has been reached and then slows it down again.
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: No
*/
if !(isServer) exitWith {};

setTimeMultiplier 60;
_condition = { daytime > 18.570 };                // condition - Needs to return bool
_statement = { setTimeMultiplier 0.01; };                // Code to be executed once condition true
[_condition, _statement] call CBA_fnc_waitUntilAndExecute;
