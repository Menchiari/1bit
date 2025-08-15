// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_hero_dialogue(){
	with obj_hero
	{
		trigger_spawn = false;
		state = states.spawn;
		speech_text = choose(
			"",
			""
		);

		var _sentence_chance = irandom_range(0,100);
		if _sentence_chance > 25
		{
			// ===== STORY PROGRESS: FIRST WAKE / CELL (NO LOOP AWARENESS) =====
			if global.story_progress == 1
			{
				// spr_head_beard1 — Grumpy male (first wake)
				if character_head == spr_head_beard1
				{
					speech_text = choose(
						"...",
						"my head...",
						"what now?",
						"ugh...",
						"damn this",
						"why me",
						"that's it",
						"?",
						"in pain",
						"where\nam I",
						"my back...",
						"what\nis this?",
						"what the\nhell...",
						"this ain't\nright...",
						"my bones\nache...",
						"damn\nnonsense",
						"tch...",
						"cheap shot...",
						"who moved\nme?",
						"place looks\nworse...",
						"same stink...",
						"damn floor...",
						"my neck's\nkilling me...",
						"should've\nstayed down",
						"cold ground...",
						"get up...\nidiot...",
						"hate this\nplace...",
						"alright...\nI'm up...",
						"damn wind...",
						"can't catch\na break...",
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
				}

				// spr_head_female2 — Tough, violent, ambitious (first wake)
				if character_head == spr_head_female2
				{
					speech_text = choose(
						"...",
						"tch.",
						"ugh...",
						"where\nam I?",
						"who brought\nme here?",
						"I'll find\nwho did\nthis...",
						"this feels\nwrong...",
						"legs still\nworking...",
						"head's\ndizzy...",
						"someone's\ngonna pay.",
						"come on.",
						"get up.\nkeep moving.",
						"still\nbreathing.",
						"stand.\nnow.",
						"cold floor.\nno problem.",
						"my turn",
						"payback\ntime",
						"up and\nready",
						"get ready",
						"one more\nstep",
						"still\nhere",
						"what was\nthat?",
						"",
						"",
						"",
						"",
						"",
						""
					);
				}

				// spr_head_female — Stoic, responsible (first wake)
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
						"I need\nto move",
						"stand.\nno hesitation",
						"keep the\nrhythm",
						"step by\nstep.",
						"focus.\nbalance.",
						"stand.\nmove.",
						"no fear.\nno noise.",
						"eyes\nforward",
						"hope is\naction",
						"steady\nnow",
						"keep the\npace",
						"mind stays\nclear",
						"every breath\ncounts",
						"move with\npurpose",
						"trust the\nsteps",
						"choose your\nstance",
						"watch the\ncorners",
						""
					);
				}

				// spr_head_female1 — Shy, quick, cautious (first wake)
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
						"just\nwoke up...",
						"still\nhere",
						"stay\nlow",
						"one\nstep",
						"am I\nsafe?",
						"please...\nno.",
						"so\ntired",
						"don't look\nback",
						"hide\nfirst",
						"keep\nmoving",
						"small\nsteps",
						"stay out\nof sight",
						"move\nslow",
						"eyes\nopen",
						"careful\nnow",
						"find a\ncorner",
						"just a\nbit more",
						""
					);
				}
			}

			// ===== STORY PROGRESS: LOOP-AWARE REAWAKEN (HARDER EDGES) =====
			if global.story_progress >= 2
			{
				// spr_head_beard1 — Grumpy male (loop-aware)
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
						"fuck this",
						"fuck\nthis\nshit",
						"crazy idiot",
						"alright",
						"heh...",
						"why",
						"damn",
						"tch...",
						"damn floor...",
						"my neck's\nkilling me...",
						"should've\nstayed down...",
						"same shit...",
						"place looks\nworse...",
						"still here...",
						"who moved\nme?",
						"arms feel\nlike lead...",
						"cheap shot...",
						"they're all\ngonna pay...",
						"can't catch\na break...",
						"where's\nmy weapon...",
						"get up...\nidiot...",
						"not over...",
						"this dump\nagain...",
						"should've\nseen it\ncoming...",
						"damn wind...",
						"they'll wish\nI stayed\ndown...",
						"hate this\nplace...",
						"my head's\nspinning...",
						"alright...\nI'm up...",
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
				}

				// spr_head_female2 — Tough, violent, ambitious (loop-aware)
				if character_head == spr_head_female2
				{
					speech_text = choose(
						"...",
						"tch.",
						"on my\nfeet",
						"they'll\nregret\nthis",
						"still\nbreathing",
						"get up.\nkeep moving.",
						"not enough to\nstop me",
						"cold floor.\nno problem.",
						"someone's\ngoing down",
						"round\ntwo",
						"come on",
						"stand.\nnow.",
						"damn",
						"chest is\nfine",
						"legs work.\nthat's enough.",
						"who's next?",
						"don't stay\ndown",
						"one more\nstep",
						"hit me\nharder",
						"try\nagain",
						"they can't\nstop me",
						"still\nhere",
						"not done\nyet",
						"my turn",
						"break\nthem",
						"get out\nof my way",
						"up and\nready",
						"keep coming",
						"not tired\nyet",
						"payback\ntime",
						"come find\nme",
						"move or\ndie",
						"their loss",
						"never\nslower",
						"too easy",
						"show me\nmore",
						"don't waste\nmy time",
						"get ready",
						""
					);
				}

				// spr_head_female — Stoic, responsible (loop-aware)
				if character_head == spr_head_female
				{
					speech_text = choose(
						"...",
						"breathing\nsteady",
						"stay the\ncourse",
						"they couldn't\nstop me",
						"this is\nmine",
						"stand.\nno hesitation.",
						"keep the\nrhythm",
						"dark is\nnot death",
						"silence is\nstrength",
						"pain means\nI'm alive",
						"step by\nstep",
						"no room for\ndoubt",
						"again?\nfine.",
						"focus.\nbalance.",
						"one foot\nthen\nthe other",
						"stand.\nmove.",
						"no fear.\nno noise.",
						"second\nchance",
						"failure\nteaches",
						"control the\nbreath",
						"moment to\nmoment",
						"begin\nagain",
						"freedom is\nearned",
						"eyes\nforward",
						"owe\nnothing",
						"hope is\naction",
						"walk.\ndon't wait.",
						"break the\ncycle",
						"steady\nnow",
						"balance first,\nthen strike.",
						"trust the\nsteps",
						"keep the\npace",
						"mind stays\nclear",
						"stand for\nsomething",
						"every breath\ncounts",
						"calm\nfirst",
						"move with\npurpose",
						""
					);
				}

				// spr_head_female1 — Shy, quick, cautious (loop-aware)
				if character_head == spr_head_female1
				{
					speech_text = choose(
						"...",
						"h-huh?",
						"I'm\nalive?",
						"again?",
						"still\nhere",
						"my arm\nhurts",
						"I can't feel\nmy legs",
						"quiet\nagain?",
						"where is\neveryone?",
						"what did\nI do?",
						"cold\nagain?",
						"don't\ncry...",
						"it's starting\nagain",
						"I remember\na little",
						"another\nstep?",
						"am I\nsafe?",
						"please...\nno.",
						"so\ntired...",
						"try\nagain",
						"don't look\nback",
						"should\nI hide?",
						"should I\nkeep moving?",
						"small\nsteps...",
						"they'll\nfind me",
						"I'll stay\nquiet...",
						"I'm not\nready...",
						"I'm still\nbreathing\nam I?",
						"move\nslow",
						"eyes\nopen",
						"not this\nplace again",
						"careful\nnow",
						"can't stop\nshaking",
						"I need to\nfind a\ncorner",
						"don't make\na sound",
						"just a\nbit more...",
						""
					);
				}
			}
		}

		// spr_head_skull — Playful, macabre
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
				"my jaw's\nunhinged",
				"this again,\nbonehead",
				"shhh...\ndon't wake\nthe spine",
				"nnggghhhak!",
				"where's\nmy meat?",
				"bones\nnever\nlie",
				"hah...\nforgot again",
				"rib count\nstable.",
				"pelvis in\nposition.",
				"skull's\ngrinning.",
				"spine feels\nloose.",
				"bone dust\nagain.",
				"marrow\nempty.",
				"lost my\nteeth",
				"shoulder\nrattle good.",
				"humor\nintact.",
				"grave was\nwarmer.",
				""
			);
		}

		// spr_head_infected — Corrupted, struggling
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
				"dripping\ninside...",
				"blood\nhot...",
				"teeth\nitch...",
				"skin too\ntight...",
				"lungs\nburn...",
				"nails\nwrong...",
				"vision\nwhite...",
				"mouth\nbitter...",
				"can't\nsee...",
				"hot\nshadows...",
				""
			);
		}

		// spr_head — Monk/ascetic, calm (fits both first and looped)
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
				"stone\nremembers.",
				"rivers\nreturn.",
				"circle\nremains.",
				"wind carries\nnames.",
				"truth has\nno edge.",
				"movement\nwithout trace.",
				""
			);
		}
	}

}