

//Hrizontal Ground Movement
if onGround
{
	if keyRight
	{
		xSpeed = approach(xSpeed, hMaxSpeed, hAccel);
	}
	else if keyLeft
	{
		xSpeed = approach(xSpeed, -hMaxSpeed, hAccel);
	}
	else
	{
		xSpeed = approach(xSpeed, 0, hDecel);
	}
}
else if !onGround
{
	if keyRight
	{
		xSpeed = approach(xSpeed, airMaxSpeed, airAccel);
	}
	else if keyLeft
	{
		xSpeed = approach(xSpeed, -airMaxSpeed, airAccel);
	}
	else
	{
		xSpeed = approach(xSpeed, 0, airDecel);
	}
}



//Jump

if onGround
{
	airJump = true;
	
	if keyA
	{
		ySpeed += jPower;
		
		onGround = false;
	}
}

if not onGround
{
	ySpeed += gForce;
	
	//Jump lower when don't hold jump
	if ySpeed < 0 and !keyA
	{
		ySpeed *= 0.3;
	}
	
	//Air jump
	if keyA and airJump == true
	{
		ySpeed += jPower;
		
		airJump = false;
	}
	
	
}
