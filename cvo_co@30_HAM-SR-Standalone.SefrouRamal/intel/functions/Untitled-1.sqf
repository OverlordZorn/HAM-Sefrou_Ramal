/*
* Author: Zorn
* function to enable / disable the PFH 
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

params [
    ["_enable",        true,         [true]       ]
];


private _PFH_ID = missionNamespace getVariable ["TIS_Spec_zeusViewer_PFH_ID", false];


switch (true) do {
    case ( (!_enable) && {_PFH_ID isEqualNotTo false} ): { _PFH_ID call CBA_fnc_removePerFrameHandler };
    case ( _enable && {_PFH_ID isEqualTo false} ): {
        /* Start Eventhandler */



        missionNamespace setVariable ["TIS_Spec_zeusViewer_PFH_ID",_PFH_ID];
    };
    default { };
};

private _codeToRun = {  /*_statement */  };
private _parameters = [  /*parameters*/  ];
private _exitCode = { /* exit code */ };
private _condition = { /*condition (false will lead to exit*/ };
private _delay = 2;

[{
    params ["_args", "_handle"];
    _args params ["_codeToRun", "_parameters", "_exitCode", "_condition"];

    if (_parameters call _condition) then {
        _parameters call _codeToRun;
    } else {
        _handle call CBA_fnc_removePerFrameHandler;
        _parameters call _exitCode;
    };
}, _delay, [_codeToRun, _parameters, _exitCode, _condition]] call CBA_fnc_addPerFrameHandler;