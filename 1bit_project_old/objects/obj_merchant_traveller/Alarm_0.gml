/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

var wpn=weapon;
var arm=armor;
var hlm=helm;
var nam=name;

with shop {
	equip_weapon(wpn);
	equip_armor(arm);
	equip_helm(hlm);
	name=nam;
	shop_text="BUY";
	shop_text_cancel="LEAVE";
	description="tap above to buy an item"
}
