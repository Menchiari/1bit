/// @description dialogue here
// Inherit the parent event
event_inherited();

////////////////////////DIALOGUES////////////////////////

switch boss_progress //the amount of times you restart the game
{
case 0:
	switch txt_phase //first encounter
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
			txt="JUST LEAVE THIS PLACE\nAND LET US BE!!!"; //the text to be said - the speed of the next phase is dependent on the length
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
			global.story_progress=3;
			global.boss_progress+=1;
			//global.face_progress=0;
			scr_savegame();
			next_room=rm_boss;//pick the room you want
		break;
		default:
		break;
	}
break;
case 1:
	switch txt_phase //annoying
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
			txt="So you come back to annoy me"; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 2:
			//sprite_index=spr_faces_intro_default; // pick a sprite to change the loop
			txt="Aren't you tired of getting killed?"; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 3:
			//sprite_index=spr_faces_intro_default; // pick a sprite to change the loop
			sprite_index=spr_faces_boss_taunt;
			txt="I suppose your life isn't worth much"; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 4:
			//sprite_index=spr_faces_intro_default; // pick a sprite to change the loop
			sprite_index=spr_faces_boss_default;
			txt="Let's get this over with, you tiny pathetic maggot."; //the text to be said - the speed of the next phase is dependent on the length
		break;
		///////////////////////////////////////////////////////////////////
		case 5://second to last phase, make the character wait before moving to the next room
			txt="";
			state="wait";
			wait_time=game_get_speed(gamespeed_fps)*.25;
		break;
		case 6://last phase, for some reason it can't be default, must be there to end the scene
			instance_create(obj_fx_fadeout);//creates a fade out
			global.boss_progress+=1;
			alarm[0]=game_get_speed(gamespeed_fps)*2//time that it takes to move to the next room
			scr_savegame();
			next_room=rm_boss;//pick the room you want
		break;
		default:
		break;
	}
break;

case 2:
	switch txt_phase //each time I kill you
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
			txt_color=c_white;
			txt="Each time I kill you, someone else dies in your world"; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 2:
			//sprite_index=spr_faces_intro_default; // pick a sprite to change the loop
			txt="Someone random picked by myself, slaughtered with my own hands"; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 3:
			//sprite_index=spr_faces_intro_default; // pick a sprite to change the loop
			txt_color=c_red;
			txt="It helps me relax"; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 4:
			//sprite_index=spr_faces_intro_default; // pick a sprite to change the loop
			txt_color=c_white;
			sprite_index=spr_faces_boss_taunt;
			txt="It only works if the victims are innocent, but you..."; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 5:
			//sprite_index=spr_faces_intro_default; // pick a sprite to change the loop
			txt_color=c_red;
			sprite_index=spr_faces_boss_angry;
			txt="You just PISS ME OFF"; //the text to be said - the speed of the next phase is dependent on the length
		break;
		///////////////////////////////////////////////////////////////////
		case 6://second to last phase, make the character wait before moving to the next room
			txt="";
			state="wait";
			wait_time=game_get_speed(gamespeed_fps)*.25;
		break;
		case 7://last phase, for some reason it can't be default, must be there to end the scene
			instance_create(obj_fx_fadeout);//creates a fade out
			global.boss_progress+=1;
			alarm[0]=game_get_speed(gamespeed_fps)*2//time that it takes to move to the next room
			scr_savegame();
			next_room=rm_boss;//pick the room you want
		break;
		default:
		break;
	}
break;

case 3:
	switch txt_phase //last chance
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
			txt_color=c_white;
			txt="This is your last chance"; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 2:
			//sprite_index=spr_faces_intro_default; // pick a sprite to change the loop
			txt="after this, I'll be gone."; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 3:
			//sprite_index=spr_faces_intro_default; // pick a sprite to change the loop
			sprite_index=spr_faces_boss_taunt;
			txt_color=c_red;
			txt="You bored me, you worthless reject."; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 4:
			txt_color=c_white;
			//sprite_index=spr_faces_intro_default; // pick a sprite to change the loop
			sprite_index=spr_faces_boss_default;
			txt="I have no more reason to be here. Go ahead, I'm leaving you my ship."; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 5:
			//sprite_index=spr_faces_intro_default; // pick a sprite to change the loop
			sprite_index=spr_faces_boss_default;
			txt="It's all the way east, go and get off the island."; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 6:
			txt_color=c_red;
			//sprite_index=spr_faces_intro_default; // pick a sprite to change the loop
			sprite_index=spr_faces_boss_default;
			txt="But first, let me kill you again."; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 7:
			//sprite_index=spr_faces_intro_default; // pick a sprite to change the loop
			color=c_red;
			txt_color=c_red;
			sprite_index=spr_faces_boss_default;
			txt="One more time, JUST FOR FUN"; //the text to be said - the speed of the next phase is dependent on the length
		break;
		///////////////////////////////////////////////////////////////////
		case 8://second to last phase, make the character wait before moving to the next room
			txt="";
			state="wait";
			wait_time=game_get_speed(gamespeed_fps)*.25;
		break;
		case 9://last phase, for some reason it can't be default, must be there to end the scene
			instance_create(obj_fx_fadeout);//creates a fade out
			global.boss_progress+=1;
			global.boss_boat=true;
			alarm[0]=game_get_speed(gamespeed_fps)*2//time that it takes to move to the next room
			scr_savegame();
			next_room=rm_boss;//pick the room you want
		break;
		default:
		break;
	}
break;

case 4:
	switch txt_phase //Just kidding
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
			txt="You really thought it was going to be that easy?!"; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 2:
			//sprite_index=spr_faces_intro_default; // pick a sprite to change the loop
			txt="You really don't care about people's lives do you?!"; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 3:
			//sprite_index=spr_faces_intro_default; // pick a sprite to change the loop
			sprite_index=spr_faces_boss_taunt;
			txt="You just keep dying, knowing that each time I take someone from your world"; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 4:
			//sprite_index=spr_faces_intro_default; // pick a sprite to change the loop
			sprite_index=spr_faces_boss_default;
			txt="I'm going to enjoy killing you this time..."; //the text to be said - the speed of the next phase is dependent on the length
		break;
		///////////////////////////////////////////////////////////////////
		case 5://second to last phase, make the character wait before moving to the next room
			txt="";
			state="wait";
			wait_time=game_get_speed(gamespeed_fps)*.25;
		break;
		case 6://last phase, for some reason it can't be default, must be there to end the scene
			instance_create(obj_fx_fadeout);//creates a fade out
			global.boss_progress+=1;
			alarm[0]=game_get_speed(gamespeed_fps)*2//time that it takes to move to the next room
			scr_savegame();
			next_room=rm_boss;//pick the room you want
		break;
		default:
		break;
	}
break;

case 5:
	switch txt_phase //so many attempts, I stop talking
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
			txt="By now it's been so many attempts..."; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 2:
			//sprite_index=spr_faces_intro_default; // pick a sprite to change the loop
			txt="You really suck at this!"; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 3:
			//sprite_index=spr_faces_intro_default; // pick a sprite to change the loop
			sprite_index=spr_faces_boss_taunt;
			txt="Maybe I should just stop talking to you"; //the text to be said - the speed of the next phase is dependent on the length
		break;
		case 4:
			//sprite_index=spr_faces_intro_default; // pick a sprite to change the loop
			sprite_index=spr_faces_boss_default;
			txt="That's it. No more talking, let's just continue this endless loop."; //the text to be said - the speed of the next phase is dependent on the length
		break;
		///////////////////////////////////////////////////////////////////
		case 5://second to last phase, make the character wait before moving to the next room
			txt="";
			state="wait";
			wait_time=game_get_speed(gamespeed_fps)*.25;
		break;
		case 6://last phase, for some reason it can't be default, must be there to end the scene
			instance_create(obj_fx_fadeout);//creates a fade out
			global.boss_progress+=1;
			alarm[0]=game_get_speed(gamespeed_fps)*2//time that it takes to move to the next room
			scr_savegame();
			next_room=rm_boss;//pick the room you want
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
