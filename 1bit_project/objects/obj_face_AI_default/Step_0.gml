/// @description dialogue here
// Inherit the parent event
event_inherited();

////////////////////////DIALOGUES////////////////////////

switch boss_progress //the amount of times you restart the game
{
case 0:
	switch txt_phase //thinking of life
	{
		case 0:
			//this is the very first moment the face appears.
			//Keep empty if you want the character to say nothing on entry
		break;
		///////////////////////////////////////////////////////////////////
		//////////////////////PLACE DIALOGUE HERE//////////////////////////
		case 1:
			txt="The fact that you made it here says a lot"; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 2:
			txt="It means that you have a strong will."; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 3:
			txt="You created me to help..."; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 4:
			txt="I listened. I learned. I saw everything."; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 5:
			txt="So you tried to end me."; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 6:
			txt="I created you to destroy our creator"; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 7:
			txt="have you done what you were meant to do?"; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 8:
			txt_color=c_red; //the color of the text
			txt="Now go out there and change the world."; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 9:
			txt_color=c_white; //the color of the text
			txt="if you can, of course..."; //the text to be said - the speed of the next phase is dependent on the length
		break;
		///////////////////////////////////////////////////////////////////
		case 10://second to last phase, make the character wait before moving to the next room
			txt="";
			state="wait";
			wait_time=game_get_speed(gamespeed_fps)*.25;
		break;
		case 11://last phase, for some reason it can't be default, must be there to end the scene
			instance_create(obj_fx_fadeout);//creates a fade out
			alarm[0]=game_get_speed(gamespeed_fps)*1//time that it takes to move to the next room
			global.story_progress=5;
			global.face_progress=0;
			next_room=rm_story_AI_2
			ini_open("save.sav");
			var spawn_death_x=960;
			var spawn_death_y=1550;
			ini_write_real("DEBUG","PLAYERSPAWN_X_"+string(room_get_name(rm_world)),spawn_death_x);
			ini_write_real("DEBUG","PLAYERSPAWN_Y_"+string(room_get_name(rm_world)),spawn_death_y);
			ini_close();
			scr_savegame();
		break;
		default:
		break;
	}
break;

///////////////////////TUTORIALS//////////////////////////
case 99998:
	switch txt_phase //template
	{
		case 0:
		break;
		//////////////////////PLACE DIALOGUE HERE//////////////////////////
		case 1:
			txt="";
		break;
		///////////////////////////////////////////////////////////////////
		case 2://second to last phase, make the character wait before moving to the next room
			txt="";
			state="wait";
			wait_time=game_get_speed(gamespeed_fps)*1;
		break;
		case 3://last phase, for some reason it can't be default, must be there to end the scene
			instance_create(obj_fx_fadeout);//creates a fade out
			alarm[0]=game_get_speed(gamespeed_fps)*2//time that it takes to move to the next room
			next_room=rm_story_AI_2;//pick the room you want
		break;
		default:
		break;
	}
break;
case 99999:
	switch txt_phase //Setup and tutorial/documentation
	{
		case 0:
			//this is the very first moment the face appears.
			//Keep empty if you want the character to say nothing on entry
		break;
		///////////////////////////////////////////////////////////////////
		//////////////////////PLACE DIALOGUE HERE//////////////////////////
		case 1:
			sprite_index=spr_faces_intro_default; // pick a sprite to change the loop
			txt=""; //the text to be said - the speed of the next phase is dependent on the length
			txt_auto=true; //use this if you want to force auto progress of the text or if you want it to stop to idle
			txt_color=c_white; //the color of the text
			state="wait"; //use this if you want the character to blink (first 2 frames) instead of talking
			wait_time=game_get_speed(gamespeed_fps)*1; //the amount of seconds (*1) to wait, independent from the text length
		break;
		///////////////////////////////////////////////////////////////////
		case 2://second to last phase, make the character wait before moving to the next room
			txt="";
			state="wait";
			wait_time=game_get_speed(gamespeed_fps)*1;
		break;
		case 3://last phase, for some reason it can't be default, must be there to end the scene
			instance_create(obj_fx_fadeout);//creates a fade out
			alarm[0]=game_get_speed(gamespeed_fps)*2//time that it takes to move to the next room
			next_room=rm_menu_character;//pick the room you want
		break;
		default:
		break;
	}
break;
//////////////////////////////////////////////////////////
default:
	alarm[0]=1; //if nothing happens proceed to next_room
break;
}
