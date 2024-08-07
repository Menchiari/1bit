// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_faction_check(target){
	switch faction
	{
		case factions.ally:
		if target.faction==factions.ally{return false;}
		else{return true;}
		break;
		
		case factions.enemy:
		if target.faction==factions.enemy {return false;}
		else {return true;}
		break;
		
		case factions.neutral:
		return false;
		break;
		
		case factions.everyone:
		return true;
		break;
	}
}
function scr_faction_check_ai(target){
	switch faction
	{
		case factions.ally:
		if target.faction==factions.ally{return false;}
		else if target.faction==factions.neutral{return false;}
		else{return true;}
		break;
		
		case factions.enemy:
		if target.faction==factions.enemy {return false;}
		else {return true;}
		break;
		
		case factions.neutral:
		return false;
		break;
		
		case factions.everyone:
		return true;
		break;
	}
}