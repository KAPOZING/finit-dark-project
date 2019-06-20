var bbox_side;

layerID = layer_get_id("CollisionLayer");
tilemap = layer_tilemap_get_id(layerID);

if xSpeed > 0
{
	bbox_side = bbox_right;
}
else if xSpeed < 0
{
	bbox_side = bbox_left;
}

if tilemap_get_at_pixel(tilemap, bbox_left, y) || tilemap_get_at_pixel(tilemap, bbox_right, y)
{
	if xSpeed > 0
	{
		xPos = xPos - (xPos % 32) + 31 - (bbox_right - xPos);
	}
	else if xSpeed < 0
	{
		xPos = xPos - (xPos % 32) - (bbox_left - xPos);
	}
	
	xSpeed = 0;
}


//Movement
if onGround
{
	//Horizontal move
	if keyRight || keyLeft
	{
		xSpeed = approach(xSpeed, hMaxSpeed * facing, hAccel);
	}
	else
	{
		xSpeed = approach(xSpeed, 0, hDecel);
	}

	
	
	//Jump
	airJump = true;
	
	if keyA
	{
		ySpeed += jPower;
		
		onGround = false;
	}
}
else if not onGround
{
	//Horizontal air move
	if keyRight || keyLeft
	{
		xSpeed = approach(xSpeed, airMaxSpeed * facing, airAccel);
	}
	else
	{
		xSpeed = approach(xSpeed, 0, airDecel);
	}
		
	//Jumping
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
