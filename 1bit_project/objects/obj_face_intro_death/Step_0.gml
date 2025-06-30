/// @description dialogue here
// Inherit the parent event
event_inherited();

////////////////////////DIALOGUES////////////////////////
switch face_progress_death //the amount of times you restart the game
{
case 0:
	switch txt_phase //you will die one day
	{
		case 0:
		break;
		//////////////////////PLACE DIALOGUE HERE//////////////////////////
		case 1:
			sprite_index=spr_faces_intro_mock;
			txt="Oh would you look at that?";
		break;
		case 2:
			sprite_index=spr_faces_intro_mock;
			txt="You want to continue do you?";
		break;
		case 3:
			sprite_index=spr_faces_intro_mock;
			txt_color=c_red;
			txt="You wish your life could last forever";
		break;
		case 4:
			sprite_index=spr_faces_intro_default;
			txt="like a pathetic coward";
		break;
		case 5:
			state="wait";
			wait_time=game_get_speed(gamespeed_fps)*1;
		break;
		case 6:
			sprite_index=spr_faces_intro_mock;
			txt="well guess what. Life isn't forever";
			color=c_red;
		break;
		case 7:
			sprite_index=spr_faces_intro_mock;
			txt="you will die and rot one day";
		break;
		case 8:
			sprite_index=spr_faces_intro_mock;
			txt="maybe sooner than you think";
		break;
		case 9:
			sprite_index=spr_faces_intro_end;
			state="talk_intense";
			txt="maybe in this very moment";
		break;
		///////////////////////////////////////////////////////////////////
		case 10://last phase, for some reason it can't be default, must be there to end the scene
			global.face_progress_death+=1;
			scr_savegame();
			file_delete("save.sav");
			file_delete("random.seed");
			game_end();
		break;
		default:
		break;
	}
break;
case 1:
	switch txt_phase //this time don't come back
	{
		case 0:
		break;
		//////////////////////PLACE DIALOGUE HERE//////////////////////////
		case 1:
			txt="And yet, you try again";
		break;
		case 2:
			txt="and again";
			txt_color=c_red;
		break;
		case 3:
			txt="without any shame, you restart";
		break;
		case 4:
			txt="and waste more of your life";
			color=c_red;
		break;
		case 5:
			txt="your pathetic insignificant life";
		break;
		case 6:
			txt="all for the same outcome";
		break;
		case 7:
			txt="enjoy your death, again";
		break;
		case 8:
			sprite_index=spr_faces_intro_end;
			state="talk_intense";
			txt="but this time don't come back";
		break;
		///////////////////////////////////////////////////////////////////
		case 9://last phase, for some reason it can't be default, must be there to end the scene
			global.face_progress_death+=1;
			scr_savegame();
			file_delete("save.sav");
			file_delete("random.seed");
			game_end();
		break;
		default:
		break;
	}
break;
case 2:
	switch txt_phase //how many times
	{
		case 0:
		break;
		//////////////////////PLACE DIALOGUE HERE//////////////////////////
		case 1:
			txt="You did come back";
		break;
		case 2:
			sprite_index=spr_faces_intro_mock
			txt="How many more times I wonder";
		break;
		case 3:
			sprite_index=spr_faces_intro_default
			txt="Before you realize there is no end";
		break;
		///////////////////////////////////////////////////////////////////
		case 4://second to last phase, make the character wait before moving to the next room
			sprite_index=spr_faces_intro_end
			txt="D E A T H - I S - O N L Y\nT H E - B E G I N N I N G";
			state="talk_intense";
			txt_color=c_red;
			color=c_red;
		break;
		case 5://last phase, for some reason it can't be default, must be there to end the scene
			global.face_progress_death+=1;
			scr_savegame();
			file_delete("save.sav");
			file_delete("random.seed");
			game_end();
		break;
		default:
		break;
	}
break;
case 3:
	switch txt_phase //last message
	{
		case 0:
		break;
		//////////////////////PLACE DIALOGUE HERE//////////////////////////
		case 1:
			txt="one last message before I go";
		break;
		case 2:
			txt="you have eroded my patience";
		break;
		case 3:
			txt="I will reset this world one last time";
		break;
		case 4:
			state="wait";
			wait_time=game_get_speed(gamespeed_fps)*1;
		break;
		case 5:
			txt="but this time I won't remember you";
			txt_color=c_red;
		break;
		case 6:
			txt="I will purposefully remove you";
			color=c_red;
		break;
		case 7:
			txt="so you can die in my memories as well";
		break;
		///////////////////////////////////////////////////////////////////
		case 8://second to last phase, make the character wait before moving to the next room
			state="wait";
			wait_time=game_get_speed(gamespeed_fps)*3;
		break;
		case 9://last phase, for some reason it can't be default, must be there to end the scene
			global.face_progress_death+=1;
			scr_savegame();
			file_delete("save.sav");
			file_delete("random.seed");
			game_end();
		break;
		default:
		break;
	}
break;
case 5:
	switch txt_phase //death is only the beginning
	{
		case 0:
		break;
		//////////////////////PLACE DIALOGUE HERE//////////////////////////
		case 1:
			txt="remember now, and forever";
			color=c_red;
			txt_color=c_red;
		break;
		///////////////////////////////////////////////////////////////////
		case 2://second to last phase, make the character wait before moving to the next room
			sprite_index=spr_faces_intro_default
			txt="death is only the beginning";
			state="talk_intense";
		break;
		case 3://last phase, for some reason it can't be default, must be there to end the scene
			scr_savegame();
			file_delete("save.sav");
			file_delete("random.seed");
			game_end();
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
break;
}
