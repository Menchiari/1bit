event_inherited();
size=3;
posx=16;
posy=12;
color=c_white;
alpha=1;
type=3;
font=fnt_ancientgods;

text="AWAKEN";
start_room=room_next(room);

switch global.story_progress
{
	case 0:
	start_room=rm_story_1;
	break;
	default:
	start_room=rm_world;
	break;
}