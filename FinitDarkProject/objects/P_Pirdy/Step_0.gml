
//Control
button_input();

//Movement
tilemap_collision();



//Animation
frame_counter();

animation_control();


//State switcher
switch currentState
{
	case characterState.normal:
		state_normal();
	break;
	
	
	case characterState.attack:
		state_attack();
	break;
	
}