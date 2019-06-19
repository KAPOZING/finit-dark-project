layerID = layer_get_id("CollisionLayer");
tilemapID = layer_tilemap_get_id(layerID);

sprite_bbox_left = sprite_get_bbox_left(sprite) - sprite_get_xoffset(sprite);
sprite_bbox_right = sprite_get_bbox_right(sprite) - sprite_get_xoffset(sprite);
sprite_bbox_top = sprite_get_bbox_top(sprite) - sprite_get_yoffset(sprite);
sprite_bbox_bottom = sprite_get_bbox_bottom(sprite) - sprite_get_yoffset(sprite);

