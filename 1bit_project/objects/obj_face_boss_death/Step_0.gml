/// @description dialogue here
// Inherit the parent event
event_inherited();

////////////////////////DIALOGUES////////////////////////

//switch boss_progress //the amount of times you restart the game
//{
//case 0:
	switch txt_phase //thinking of life
	{
		case 0:
			//this is the very first moment the face appears.
			//Keep empty if you want the character to say nothing on entry
		break;
		///////////////////////////////////////////////////////////////////
		//////////////////////PLACE DIALOGUE HERE//////////////////////////
		case 1:
			//sprite_index=spr_faces_intro_default; // pick a sprite to change the loop
			sprite_index=spr_faces_boss_dead;
			txt_color=c_red;
			color=c_red;
			txt="NOOOO..... HOW???"; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 2:
			//sprite_index=spr_faces_intro_default; // pick a sprite to change the loop
			txt="YOU THINK YOU CAN JUST COME HERE AND DESTROY ME???"; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 3:
			//sprite_index=spr_faces_intro_default; // pick a sprite to change the loop
			sprite_index=spr_faces_boss_deadcough;
			txt="THIS CAN'T BE IT\nTHIS WON'T BE IT"; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 4:
			//sprite_index=spr_faces_intro_default; // pick a sprite to change the loop
			sprite_index=spr_faces_boss_deadcough;
			txt="YOU WILL NEVER LEAVE THIS ISLAND"; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 5:
			//sprite_index=spr_faces_intro_default; // pick a sprite to change the loop
			sprite_index=spr_faces_boss_deadcough;
			txt="I WON'T ALLOW IT"; //the text to be said - the speed of the next phase is dependent on the length
		break;
		///////////////////////////////////////////////////////////////////
		case 6://second to last phase, make the character wait before moving to the next room
			color=choose(c_white,c_black,c_red);
			txt="";
			state="wait";
			wait_time=game_get_speed(gamespeed_fps)*.25;
		break;
		case 7://last phase, for some reason it can't be default, must be there to end the scene
			global.story_progress=4;
			global.face_progress=0;
			scr_savegame();
			game_restart();
			//game_end();
		break;
		default:
		break;
	}
//break;

/////////////////////////TUTORIALS//////////////////////////
//case 99998:
//	switch txt_phase //template
//	{
//		case 0:
//		break;
//		//////////////////////PLACE DIALOGUE HERE//////////////////////////
//		case 1:
//			txt="";
//		break;
//		///////////////////////////////////////////////////////////////////
//		case 2://second to last phase, make the character wait before moving to the next room
//			txt="";
//			state="wait";
//			wait_time=game_get_speed(gamespeed_fps)*1;
//		break;
//		case 3://last phase, for some reason it can't be default, must be there to end the scene
//			instance_create(obj_fx_fadeout);//creates a fade out
//			alarm[0]=game_get_speed(gamespeed_fps)*2//time that it takes to move to the next room
//			next_room=rm_menu_character;//pick the room you want
//		break;
//		default:
//		break;
//	}
//break;
//case 99999:
//	switch txt_phase //Setup and tutorial/documentation
//	{
//		case 0:
//			//this is the very first moment the face appears.
//			//Keep empty if you want the character to say nothing on entry
//		break;
//		///////////////////////////////////////////////////////////////////
//		//////////////////////PLACE DIALOGUE HERE//////////////////////////
//		case 1:
//			sprite_index=spr_faces_intro_default; // pick a sprite to change the loop
//			txt=""; //the text to be said - the speed of the next phase is dependent on the length
//			txt_auto=true; //use this if you want to force auto progress of the text or if you want it to stop to idle
//			txt_color=c_white; //the color of the text
//			state="wait"; //use this if you want the character to blink (first 2 frames) instead of talking
//			wait_time=game_get_speed(gamespeed_fps)*1; //the amount of seconds (*1) to wait, independent from the text length
//		break;
//		///////////////////////////////////////////////////////////////////
//		case 2://second to last phase, make the character wait before moving to the next room
//			txt="";
//			state="wait";
//			wait_time=game_get_speed(gamespeed_fps)*1;
//		break;
//		case 3://last phase, for some reason it can't be default, must be there to end the scene
//			instance_create(obj_fx_fadeout);//creates a fade out
//			alarm[0]=game_get_speed(gamespeed_fps)*2//time that it takes to move to the next room
//			next_room=rm_menu_character;//pick the room you want
//		break;
//		default:
//		break;
//	}
//break;
////////////////////////////////////////////////////////////
//default:
//	alarm[0]=1; //if nothing happens proceed to next_room
//break;
//}
