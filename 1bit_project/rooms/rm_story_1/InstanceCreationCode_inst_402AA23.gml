with obj_hero
{	
	trigger_spawn=false;
	state=states.spawn;
	speech_text=choose("dad?","mom?");
	if character_head=spr_head_beard1 {speech_text="what the..?";}
	if character_head=spr_head_female2 {speech_text="dad?";}
	if character_head=spr_head_female {speech_text=choose("dad?","mom?");}
	if character_head=spr_head_female1 {speech_text="mom?";}
	if character_head=spr_head_skull {speech_text="ghlmphf";}
	if character_head=spr_head_infected {speech_text="ghaarghh";}
	if character_head=spr_head {speech_text="awaken";}
}