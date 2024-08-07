/// @description double check compare and delete
/*
repeat(5)
{
	var other_item=collision_circle(x,y,active_range,obj_ui_shop,true,true);
	if instance_exists(other_item)
	{
		var chance=irandom_range(0,100);
		if other_item.weapon.price+other_item.armor.price+other_item.helm.price < weapon.price+armor.price+helm.price
		&& chance>75
		{instance_destroy(other_item);}
		else {instance_destroy();}
	}
}