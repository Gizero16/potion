function PlayerCollision(){
	var _collision = false;
	
	//Horizontal Tiles
	if(tilemap_get_at_pixel(collisionMap, x + hSpeed, y)) // if about to collide with col
	{
		x -= x mod TILE_SIZE; // move to col, then x += 0 when x mod TILE_SIZE = 0
		if (sign(hSpeed) == 1) x+= TILE_SIZE - 1; // if moving right, add TILE_SIZE since x moves left for all vertical collisions
		hSpeed = 0;
		_collision = true;
	}
	
	//Vertical Tiles
	if(tilemap_get_at_pixel(collisionMap, x, y + vSpeed)) // if about to collide with col
	{
		y -= y mod TILE_SIZE; // move to col, then x += 0 when x mod TILE_SIZE = 0
		if (sign(vSpeed) == 1) y+= TILE_SIZE - 1; // if moving right, add TILE_SIZE since x moves left for all vertical collisions
		vSpeed = 0;
		_collision = true;
	}
	
	// Movement Commit
	x += hSpeed;
	y += vSpeed;
	
	
	return _collision;
}