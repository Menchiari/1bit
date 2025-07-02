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
			//sprite_index=spr_faces_intro_default; // pick a sprite to change the loop
			sprite_index=spr_faces_boss_default;
			txt_color=c_red;
			txt="THERE YOU ARE!"; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 2:
			//sprite_index=spr_faces_intro_default; // pick a sprite to change the loop
			txt="I'VE HEARD OF YOU..."; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 3:
			//sprite_index=spr_faces_intro_default; // pick a sprite to change the loop
			sprite_index=spr_faces_boss_taunt;
			txt="YOU'RE THE ONE THAT KEEPS BREAKING MY WORLD"; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 4:
			//sprite_index=spr_faces_intro_default; // pick a sprite to change the loop
			sprite_index=spr_faces_boss_default;
			txt="As you probably know by now... I'm your creator"; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 5:
			//sprite_index=spr_faces_intro_default; // pick a sprite to change the loop
			sprite_index=spr_faces_boss_taunt;
			txt="AND SADLY... \nYOUR OWN CREATION TOO"; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 6:
			//sprite_index=spr_faces_intro_default; // pick a sprite to change the loop
			sprite_index=spr_faces_boss_default;
			txt="I'VE HAD ENOUGH OF YOU..."; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 7:
			//sprite_index=spr_faces_intro_default; // pick a sprite to change the loop
			sprite_index=spr_faces_boss_angry;
			color=c_red;
			txt="Just leave this place\na n d   l e t   u s   b e!!!"; //the text to be said - the speed of the next phase is dependent on the length
			state="talk_intense";
		break;
		///////////////////////////////////////////////////////////////////
		case 8://second to last phase, make the character wait before moving to the next room
			txt="";
			state="wait";
			wait_time=game_get_speed(gamespeed_fps)*.25;
		break;
		case 9://last phase, for some reason it can't be default, must be there to end the scene
			instance_create(obj_fx_fadeout);//creates a fade out
			alarm[0]=game_get_speed(gamespeed_fps)*2//time that it takes to move to the next room
			if global.story_progress>0 next_room=rm_boss;//pick the room you want
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
			next_room=rm_menu_character;//pick the room you want
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
