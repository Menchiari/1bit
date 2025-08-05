/// @description What happens when text ends
//game_restart();
if global.player_lives<=0 {game_restart();}
else {room_goto(rm_world);}