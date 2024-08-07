var offset=70;

var choice=choose(0,0,0,0,1,1,1,2,2,2,3)//,3,4,5,5,6
switch choice
{
	case 0:
	repeat(4)
	{//bandit
		spawn_npc_test(x+random_range(-offset,offset),y+random_range(-offset,offset),
		23);
	}
	break;
	case 1:
	repeat(3)
	{//tough bandit
		spawn_npc_test(x+random_range(-offset,offset),y+random_range(-offset,offset),
	24);
	}
	break;
	case 2:
	repeat(5)
	{//plagued peasant
		spawn_npc_test(x+random_range(-offset,offset),y+random_range(-offset,offset),
	31);
	}
	break;
	case 3:
	repeat(1)
	{//minotaur
		spawn_npc_test(x+random_range(-offset,offset),y+random_range(-offset,offset),
	44);
	}
	break;
	case 4:
	repeat(1)
	{//knight
		spawn_npc_test(x+random_range(-offset,offset),y+random_range(-offset,offset),
	38);
	}
	break;
	case 5:
	repeat(4)
	{//bandit
		spawn_npc_test(x+random_range(-offset,offset),y+random_range(-offset,offset),
		23);
	}
	repeat(5)
	{//???
		spawn_npc_test(x+random_range(-offset,offset),y+random_range(-offset,offset),
	31);
	}
	break;
	case 6:
	repeat(irandom_range(1,6))
	{//random
		spawn_npc_test(x+random_range(-offset,offset),y+random_range(-offset,offset),
	irandom_range(23,40));
	}
	break;
}
