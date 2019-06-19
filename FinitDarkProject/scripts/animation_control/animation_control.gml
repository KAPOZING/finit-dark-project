
switch currentState
{
	case characterState.normal:
		
		//Facing character as direction input
		if keyRight
		{
			facing = 1;
		}
		else if keyLeft
		{
			facing = -1;
		}
		if facing >= 0 and keyLeft
		{
			frameSpeed = 0.05;
			sprite = Pirdy_Turn;
		}
		else if facing <= 0 and keyRight
		{
			frameSpeed = 0.05;
			sprite = Pirdy_Turn;
		}
		
		//Play animation when it's moving
		if keyRight or keyLeft
		{
			frameSpeed = 0.2;
			sprite = Pirdy_MoveHorizontal;
		}
		else
		{
			frameSpeed = 0.1;
			sprite = Pirdy_IdleHorizontal;
		}
		
	break;
}

if lastSprite != sprite
{
	lastSprite = sprite;
	frame = 0;
}