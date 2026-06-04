/// @description stop vibration on any destruction path
var _gp = variable_global_exists("gamepad_slot") ? global.gamepad_slot : 0;
if (_gp >= 0) gamepad_set_vibration(_gp, 0, 0);