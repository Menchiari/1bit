/// @description Insert description here
// You can write your code in this editor
if instance_exists(dialogue_character)
{
	if dialogue_character!=obj_hero.id
	{
		dialogue_character.dialogue_positive=dialogue_positive;
		dialogue_character.dialogue_neutral=dialogue_neutral;
		dialogue_character.dialogue_negative=dialogue_negative;
		dialogue_character.dialogue_variation=true;
		instance_destroy();
	}
}
else
{
	active=true;
}