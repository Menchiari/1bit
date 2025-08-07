with obj_hero
{	
	trigger_spawn=false;
	state=states.spawn;
	speech_text=choose(
		//"...",
		//"my head...",
		//"what now?",
		//"ugh...",
		//"damn this",
		//"not again",
		//"why me",
		//"that's it",
		//"?",
		//"in pain",
		//"",
		"",
		"",
		"",
		"",
		"",
		"",
		"",
		"",
		"",
		"",
		"",
		"",
		""
	);
	var _sentence_chance = irandom_range(0,100);
	if _sentence_chance > 40
	{
		if global.story_progress == 1
		{
			if character_head == spr_head_beard1
			{
				speech_text = choose(
					"...",
					"my head...",
					"what now?",
					"ugh...",
					"damn this",
					"not again",
					"why me",
					"that's it",
					"?",
					"in pain",
					"ugh...",
					"where\nam I",
					"my back...",
					"not\nagain...",
					"what\nis this?",
					"what the\nhell...",
					"this ain't\nright...",
					"my bones\nache...",
					"damn\nnonsense"
				);
			}
			if character_head == spr_head_female2
			{
				speech_text = choose(
					"...",
					"tch.",
					"ugh...",
					"where\nam I?",
					"who\nbrought me here?",
					"I'll find\nwho did this...",
					"this feels\nwrong...",
					"legs still\nworking...",
					"head's\ndizzy...",
					"someone's\ngonna pay."
				);
			}
			if character_head == spr_head_female
			{
				speech_text = choose(
					"...",
					"?",
					"where\nam I",
					"what\nnow?",
					"I don't\nremember...",
					"what is\nthis place?",
					"stay\ncalm...",
					"I need\nto move"
				);
			}
			if character_head == spr_head_female1
			{
				speech_text = choose(
					"...",
					"huh...?",
					"my head...",
					"I feel\nsick...",
					"where\nam I?",
					"I don't\nunderstand...",
					"it's so\nquiet...",
					"am I\nalone?",
					"ugh...",
					"just\nwoke up..."
				);
			}
		}

		if global.story_progress >= 2
		{
			if character_head == spr_head_beard1
			{
				speech_text = choose(
					"...",
					"ugh...",
					"my damn\nhead...",
					"back\nagain...",
					"still not\ndead?",
					"this shit\nagain...",
					"cracked\nribs...",
					"not over...\nyet...",
					"damn\ncycle...",
					"bones\nhurt...",
					"how many\ntimes now?",
					"not this\nagain...",
					"they won't\nkill me...",
					"cold ground...\nagain...",
					"I need to\nmove...",
					"fuck...",
					"not again...",
					"ugh...",
					"everything\nhurts..."
				);
			}
			if character_head == spr_head_female2
			{
				speech_text = choose(
					"...",
					"tch.",
					"not again...",
					"they\nleft me...",
					"woke up\nbreathing...",
					"get up,\nkeep moving",
					"not enough to\nkill me...",
					"cold again,\nwhatever...",
					"someone's\ngoing down...",
					"round\ntwo.",
					"still not\nenough...",
					"stand up.\nnow.",
					"fuck...",
					"my chest...",
					"legs still\nwork...",
					"who's next...",
					"I don't\ndie easy...",
					"one more\nstep...",
					"the ground\nagain...",
					"they\ncan't stop me."
				);
			}
			if character_head == spr_head_female
			{
				speech_text = choose(
					"...",
					"still\nbreathing.",
					"same\npath.",
					"they\ncouldn’t stop me.",
					"this\nis mine.",
					"stand.\ndon’t hesitate.",
					"keep\nthe rhythm.",
					"dark\nis not death.",
					"the\nvoid is silent.",
					"pain\nis a signal.",
					"step\nby step.",
					"no time\nfor doubt.",
					"again?\nthen again.",
					"it’s never\nfinal.",
					"focus.\nbalance.",
					"one foot.\nthen the other.",
					"stand.\nthen move.",
					"no fear.\nno noise.",
					"another\nchance.",
					"failure\nis a teacher.",
					"breath\nis control.",
					"moment\nby moment.",
					"begin\nagain.",
					"freedom\nis earned.",
					"eyes\nforward.",
					"no one\nowes me.",
					"hope\nis action.",
					"walk.\ndon’t wait.",
					"break\nthe cycle."
				);

			}
			if character_head == spr_head_female1
			{
				speech_text = choose(
					"...",
					"h-huh...?",
					"I'm...\nalive?",
					"again...?",
					"still\nhere...",
					"my arm...\nhurts...",
					"I can't\nfeel my legs...",
					"quiet...\nagain...",
					"where's\neveryone...?",
					"what\ndid I do...?",
					"cold...\nagain...",
					"can't cry,\nnot now...",
					"it's\nstarting again...",
					"I remember...\na little...",
					"stay\nlow...",
					"one\nstep...",
					"am I\nsafe?",
					"please...\nnot again...",
					"so\ntired...",
					"try\nagain..."
				);
			}
		}
	}

	if character_head == spr_head_skull
	{
		speech_text = choose(
			"by the marrow\nof my memory...",
			"knuckles...\ncheck.",
			"skull intact.\nagain.",
			"grk-ghak!",
			"hhheh...",
			"teeth first,\nthen toes.",
			"been dead.\nstill late.",
			"rattled\nawake!",
			"mirth or\nmurder?",
			"joints still\nclickin'",
			"who left\nthe gate open?",
			"just\nbone luck!",
			"woke up\nlaughing again",
			"clatter\nconfirmed.",
			"no blood...\nno problem.",
			"whispers...\nin my sockets",
			"what\nrattled me?",
			"cracked.\nbut functional.",
			"my jaw's\nunhinged.",
			"humor\nrebooted.",
			"this\nagain, bonehead",
			"shhh...\ndon't wake the spine",
			"nnggghhhak!",
			"where's\nmy meat?",
			"bones never\nlie",
			"hah...\nforgot again",
			""
		);
	}
	if character_head == spr_head_infected
	{
		speech_text = choose(
			"...",
			"ghhh...",
			"kkkh...",
			"rrhhh...",
			"ngghh...",
			"burns...",
			"eyes\nwrong...",
			"bones\nitch",
			"stop\nit",
			"where...",
			"again...",
			"hurts...",
			"quiet\nnow...",
			"wrhhg...",
			"taste\niron...",
			"no more\nlight",
			"inside\nbad...",
			"zzghhhh...",
			"noise...\nnoise...",
			"skin\nfever...",
			"pull me\nout...",
			"can't...\nmove...",
			"voice\nnot mine...",
			"rrrghk...",
			""
		);
	}
	if character_head == spr_head
	{
		speech_text = choose(
			"this breath\nagain...",
			"the wind\nreturns.",
			"balance\nreset.",
			"the edge\nawaits.",
			"pain is\na teacher.",
			"stillness\nin motion.",
			"another step\nin the circle.",
			"the path\nunfolds...",
			"ashes\nrearranged.",
			"this world\nremembers.",
			"each death\na whisper.",
			"awakened.\nagain.",
			"the echo\npersists.",
			"clarity\nis painless.",
			"no self,\nno loss.",
			"again\nthe current pulls.",
			"time\nerases shape.",
			"form is\ntemporary.",
			"now is\ntruth.",
			"walk\nwithout weight.",
			"silent\ntide...",
			"step lightly\non the void.",
			"observe.\naccept.",
			""
		);
	}
}