
if ySpeed > 0 //Character going downward
{
	var t1 = tilemap_get_at_pixel(tilemapID, bbox_left, bbox_bottom) & tile_index_mask;
	var t2 = tilemap_get_at_pixel(tilemapID, bbox_right, bbox_bottom) & tile_index_mask;
	
	if t1 != 0 or t2 != 0
	{
		yPos = ((bbox_bottom & ~ 31)-6) - sprite_bbox_bottom;
		ySpeed = 0;
		
		onGround = true;
	}
}

if ySpeed < 0 //Character going upward
{
	var t1 = tilemap_get_at_pixel(tilemapID, bbox_left, bbox_top) & tile_index_mask;
	var t2 = tilemap_get_at_pixel(tilemapID, bbox_right, bbox_top) & tile_index_mask;
	
	if t1 != 0 or t2 != 0
	{
		yPos = ((bbox_top & ~ 31)-1) - sprite_bbox_top;
		ySpeed = 0;
	}
}