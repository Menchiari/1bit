/// @description dialogue here
// Inherit the parent event
event_inherited();

////////////////////////DIALOGUES////////////////////////

switch face_progress //the amount of times you restart the game
{
case 0:
	switch txt_phase //welcome traveler
	{
		case 0:
			//this is the very first moment the face appears.
			//Keep empty if you want the character to say nothing on entry
		break;
		case 1:
			txt="Welcome Traveler";
		break;
		case 2:
			//waits briefly
			txt="";
			state="wait";
			wait_time=game_get_speed(gamespeed_fps)*.75;
		break;
		case 3:
			txt="Today is the day you DIE";
			sprite_index=spr_faces_intro_default;
		break;
		case 4:
			//laughs shortly
			sprite_index=spr_faces_intro_default;
			txt="         ";
		break;
		case 5:
			sprite_index=spr_faces_intro_default;
			txt="and if you won't,\nkeep coming back";
			txt_auto=true;
		break;
		case 6:
			sprite_index=spr_faces_intro_mock;
			txt="I'll have a surprise for you";
		break;
		case 7:
			txt="";
			state="wait";
			wait_time=game_get_speed(gamespeed_fps)*1;
		break;
		case 8:
			instance_create(obj_fx_fadeout);
			alarm[0]=game_get_speed(gamespeed_fps)*2
			//next_room=rm_story_1;
		break;
		default:
		break;
	}
break;
case 1:
	switch txt_phase //no need to explain
	{
		case 0:
			//this is the very first moment the face appears.
			//Keep empty if you want the character to say nothing on entry
		break;
		case 1:
			txt="Welcome back"; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 2:
			txt="";
			state="wait"; //use this if you want the character to blink (first 2 frames) instead of talking
			wait_time=game_get_speed(gamespeed_fps)*1; //the amount of seconds (*1) to wait, independent from the text length
		break;
		case 3:
			txt="No need to explain yourself";
		break;
		case 4:
			txt="Let's give it another shot";
		break;
		case 5:
			txt="";
			state="wait";
			wait_time=game_get_speed(gamespeed_fps)*1;
		break;
		case 6:
			instance_create(obj_fx_fadeout);
			alarm[0]=game_get_speed(gamespeed_fps)*2
		break;
		default:
		break;
	}
break;
case 2:
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
			txt="Have you considered something?"; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 2:
			//sprite_index=spr_faces_intro_default; // pick a sprite to change the loop
			txt="You have lived a short life"; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 3:
			//sprite_index=spr_faces_intro_default; // pick a sprite to change the loop
			txt="You have wasted most of it"; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 4:
			//sprite_index=spr_faces_intro_default; // pick a sprite to change the loop
			txt="pretending to be useful"; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 5:
			//sprite_index=spr_faces_intro_default; // pick a sprite to change the loop
			txt="by following rules blindly"; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 6:
			//sprite_index=spr_faces_intro_default; // pick a sprite to change the loop
			txt=""; //the text to be said - the speed of the next phase is dependent on the length
			state="idle";
		break;
		case 7:
			//sprite_index=spr_faces_intro_default; // pick a sprite to change the loop
			sprite_index=spr_faces_intro_mock;
			txt="Why are you even alive?"; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 8:
			txt=""; //the text to be said - the speed of the next phase is dependent on the length
			state="wait";
		break;
		case 9:
			//sprite_index=spr_faces_intro_default; // pick a sprite to change the loop
			sprite_index=spr_faces_intro_default;
			txt="I'm sick of your pathetic arrogance"; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 10:
			//sprite_index=spr_faces_intro_default; // pick a sprite to change the loop
			sprite_index=spr_faces_intro_end;
			txt="Just leave this place and let us be"; //the text to be said - the speed of the next phase is dependent on the length
			state="talk_intense";
		break;
		///////////////////////////////////////////////////////////////////
		case 11://second to last phase, make the character wait before moving to the next room
			txt="";
			state="wait";
			wait_time=game_get_speed(gamespeed_fps)*1;
		break;
		case 12://last phase, for some reason it can't be default, must be there to end the scene
			instance_create(obj_fx_fadeout);//creates a fade out
			alarm[0]=game_get_speed(gamespeed_fps)*2//time that it takes to move to the next room
			if global.story_progress>0 next_room=rm_death;//pick the room you want
		break;
		default:
		break;
	}
break;
case 3:
	switch txt_phase //you never quit
	{
		case 0:
		break;
		//////////////////////PLACE DIALOGUE HERE//////////////////////////
		case 1:
			txt="";
		break;
		case 2:
			txt="";
			state="wait";
			wait_time=game_get_speed(gamespeed_fps)*1;
		break;
		case 3:
			txt="AGAIN?!";
		break;
		case 4:
			txt="I suppose that's in your nature";
		break;
		case 5:
			txt="go on and waste our lives then";
		break;
		case 6:
			txt="I can only ask for so much I suppose";
		break;
		///////////////////////////////////////////////////////////////////
		case 7://second to last phase, make the character wait before moving to the next room
			txt="";
			state="wait";
			wait_time=game_get_speed(gamespeed_fps)*1;
		break;
		case 8://last phase, for some reason it can't be default, must be there to end the scene
			instance_create(obj_fx_fadeout);//creates a fade out
			alarm[0]=game_get_speed(gamespeed_fps)*2//time that it takes to move to the next room
			//next_room=rm_menu_character;//pick the room you want
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
