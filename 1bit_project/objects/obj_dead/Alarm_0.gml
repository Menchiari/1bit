switch death_choice
{
	case 1:
	death_a=death_1_a;
	death_b=death_1_b;
	break;
	case 2:
	death_a=death_2_a;
	death_b=death_2_b;
	break;
	case 3:
	death_a=death_3_a;
	death_b=death_3_b;
	break;	
}
image_index=death_a;
image_speed=random_range(.5,.75);
dead=true;