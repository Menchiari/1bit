/// @description dialogue here
// Inherit the parent event
event_inherited();

var buttony=288;
var button1x=25;
var button2x=90;
var buttoncx=60;

////////////////////////DIALOGUES////////////////////////
switch princess_choice
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
			txt="You found me.";
		break;
		case 2:
			txt="I was waiting throughout eternity";
		break;
		case 3:
			txt="for someone who could still see";
		break;
		case 4:
			txt="I watched your world grow, and now what's left is only this.";
		break;
		case 5:
			sprite_index=spr_faces_princess_important;
			txt="tell me, what do you seek?";
			state="question";
			//spawn buttons with replies to nothing +=1 purpose/peace
			var r1=instance_create_depth(button1x,buttony,button_depth,obj_face_button);
			with r1 {txt="purpose"; nextnumber=6;}
			var r2=instance_create_depth(button2x,buttony,button_depth,obj_face_button);
			with r2 {txt="peace"; nextnumber=6;}
		break;
		case 6:
			sprite_index=spr_faces_princess_important;
			txt="What makes you human?";
			state="question";
			//spawn buttons with replies to nothing +=1 life/death
			r1=instance_create_depth(button1x,buttony,button_depth,obj_face_button);
			with r1 {txt="life"; nextnumber=7;}
			r2=instance_create_depth(button2x,buttony,button_depth,obj_face_button);
			with r2 {txt="death"; nextnumber=7;}
		break;
		case 7:
			sprite_index=spr_faces_princess_wonder;
			txt="Are you fulfilled?";
			state="question";
			//spawn buttons with replies to nothing +=1 somewhat/no
			r1=instance_create_depth(button1x,buttony,button_depth,obj_face_button);
			with r1 {txt="somewhat"; nextnumber=8;}
			r2=instance_create_depth(button2x,buttony,button_depth,obj_face_button);
			with r2 {txt="no"; nextnumber=8;}
		break;
		case 8:
			sprite_index=spr_faces_princess_important;
			txt="Now tell me why you came to my house.";
			state="question";
			//spawn buttons with replies to Who are you? 9 or Where am I? 11
			r1=instance_create_depth(button1x,buttony,button_depth,obj_face_button);
			with r1 {txt="who are you?"; nextnumber=9;}
			r2=instance_create_depth(button2x,buttony,button_depth,obj_face_button);
			with r2 {txt="where am I?"; nextnumber=11;}
		break;
		case 9:
			sprite_index=spr_faces_princess_sad;
			txt="Do you remember your very first thought, before fear, language, and hope?";
		break;
		case 10:
			txt="that was me. I've been here since then.";
			state="question";
			//spawn buttons with replies to nod 12 or yawn 15
			r1=instance_create_depth(button1x,buttony,button_depth,obj_face_button);
			with r1 {txt="nod"; nextnumber=12;}
			r2=instance_create_depth(button2x,buttony,button_depth,obj_face_button);
			with r2 {txt="yawn"; nextnumber=15;}
		break;
		case 11:
			txt="You're inside your soul. Leave this place and you'll be lost forever.";
			state="question";
			//spawn buttons with replies to nod 12 or yawn 15
			r1=instance_create_depth(button1x,buttony,button_depth,obj_face_button);
			with r1 {txt="nod"; nextnumber=12;}
			r2=instance_create_depth(button2x,buttony,button_depth,obj_face_button);
			with r2 {txt="yawn"; nextnumber=15;}
		break;
		case 12:
			sprite_index=spr_faces_princess_politesmile;
			txt="I appreciate your politeness.";
		break;
		case 13:
			txt="Now please go.";
		break;
		case 14:
			sprite_index=spr_faces_princess_default;
			txt="I am tired of rejecting the truth.";
			state="question";
			//spawn buttons with replies to truth? 17 or leave 33
			r1=instance_create_depth(button1x,buttony,button_depth,obj_face_button);
			with r1 {txt="truth"; nextnumber=17;}
			r2=instance_create_depth(button2x,buttony,button_depth,obj_face_button);
			with r2 {txt="leave"; nextnumber=33;}
		break;
		case 15:
			sprite_index=spr_faces_princess_bigquestion;
			txt="How dare you insult me?";
		break;
		case 16:
			txt="Have you lost all sense of respect?";
			state="question";
			//spawn buttons with replies to apologize 20 insult 21
			r1=instance_create_depth(button1x,buttony,button_depth,obj_face_button);
			with r1 {txt="apologize"; nextnumber=20;}
			r2=instance_create_depth(button2x,buttony,button_depth,obj_face_button);
			with r2 {txt="really insult"; nextnumber=21;}
		break;
		case 17:
			sprite_index=spr_faces_princess_sad;
			txt="You have rejected all truths";
		break;
		case 18:
			txt="You have lived a lie, full of betrayals and denial.";
		break;
		case 19:
			sprite_index=spr_faces_princess_faces;
			txt="Is there anything you want from me?";
			state="question";
			//spawn buttons with replies to you 27 item 30
			r1=instance_create_depth(button1x,buttony,button_depth,obj_face_button);
			with r1 {txt="you"; nextnumber=27;}
			r2=instance_create_depth(button2x,buttony,button_depth,obj_face_button);
			with r2 {txt="item"; nextnumber=30;}
		break;
		case 20:
			sprite_index=spr_faces_princess_politesmile;
			txt="Apologies accepted. Now leave, let me be.";
			state="question";
			//spawn buttons with leave 33
			r1=instance_create_depth(buttoncx,buttony,button_depth,obj_face_button);
			with r1 {txt="leave"; nextnumber=33;}
		break;
		case 21:
			sprite_index=spr_faces_princess_important;
			txt="That's it. No more niceties.";
		break;
		case 22:
			txt="You're here to kill me, are you?";
		break;
		case 23:
			sprite_index=spr_faces_princess_default;
			txt="Who sent you?!";
			state="question";
			//spawn buttons with replies to answer her +=1
			r1=instance_create_depth(buttoncx,buttony,button_depth,obj_face_button);
			with r1 {txt="answer"; nextnumber=24;}
		break;
		case 24:
			sprite_index=spr_faces_princess_bigquestion;
			txt="Is that so...";
		break;
		case 25:
			txt="Well then you leave me no choice.";
		break;
		case 26:
			txt="Prepare to die.";
			state="question";
			//spawn buttons with replies to fight (go to princess room and global.princess=false)
			r2=instance_create_depth(buttoncx,buttony,button_depth,obj_face_button);
			with r2 {txt="fight"; nextnumber=-1;nextroom=rm_story_princess_fight;}//todo add princess fight
		break;
		case 27:
			sprite_index=spr_faces_princess_politesmile;
			txt="That is very nice of you, but you can't have me.";
		break;
		case 28:
			txt="I'm only a fragment of your memories.";
		break;
		case 29:
			txt="Now wake up, my brave little one.";
			state="question";
			//spawn buttons with replies to awaken 33
			r1=instance_create_depth(buttoncx,buttony,button_depth,obj_face_button);
			with r1 {txt="awaken"; nextnumber=33;}
		break;
		case 30:
			sprite_index=spr_faces_princess_important;
			txt="I should've known.";
		break;
		case 31:
			sprite_index=spr_faces_princess_sad;
			txt="Nobody comes here for no reason...";
		break;
		case 32:
			sprite_index=spr_faces_princess_faces;
			txt="Go ahead, grab whatever you desire and leave me alone.";
			state="question";
			//spawn buttons with replies to raid home
			r2=instance_create_depth(buttoncx,buttony,button_depth,obj_face_button);
			with r2 {txt="raid home"; nextnumber=-1;nextroom=rm_story_princess_raid;}//todo add princess fight
		break;
		case 33://last phase, for some reason it can't be default, must be there to end the scene
			global.princess=false;
			next_room=rm_world;
			instance_create(obj_fx_fadeout);
			alarm[0]=game_get_speed(gamespeed_fps)*2
		break;
		default:
		break;
	}
break;
case 1:
break;
}