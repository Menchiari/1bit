with obj_hero
{
	trigger_spawn=false;
	state=states.spawn;
	//if global.deathcount==1 {room_goto(rm_gameover);}
	if global.deathcount==2 {speech_text="who are you?"}
	if global.deathcount==3 {speech_text="you again?"}
	if global.deathcount==4 {speech_text="where am I?"}
	if global.deathcount==5 {speech_text="what is happening to me?"}
	if global.deathcount==6 {speech_text="..."}
	if global.deathcount==7 {speech_text="it hurts every time"}
	if global.deathcount==8 {speech_text="I just want to die..."}
	if global.deathcount==9 {speech_text="this can't be happening"}
	if global.deathcount==10 {speech_text="this won't last forever"}
	if global.deathcount==11 {speech_text="echoes whisper it's almost over"}
	if global.deathcount==12 {speech_text="I can feel my sould fading"}
	if global.deathcount==13 {speech_text="only four attempts left"}
	if global.deathcount==14 {speech_text="three more tries"}
	if global.deathcount==15 {speech_text="two more deaths"}
	if global.deathcount==16 {speech_text="last chance"}
	if global.deathcount==17 {room_goto(rm_faces_death);}
}