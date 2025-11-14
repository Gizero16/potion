// Check if mouse released
if (!isThrown && mouse_check_button_released(1)) {
    isThrown = true;
	mx = mouse_x;
    my = mouse_y;
}

// Behavior
if (!isThrown) {
    // follow player
    x = objPlayer.x;
    y = objPlayer.y;
} else {
    // move toward mouse position
    
    var dir = point_direction(x, y, mx, my);
    var dist = point_distance(x, y, mx, my);
	
    if (dist > move_speed) {
        x += lengthdir_x(move_speed, dir);
        y += lengthdir_y(move_speed, dir);
		image_angle += 5;
		if (tilemap_get_at_pixel(objPlayer.collisionMap, x , y)) {
			instance_destroy();
			objPlayer.createOnce = true;
		}
		
    } else {
        x = mx;
        y = my;
        objPlayer.createOnce = true;
        show_debug_message("i am being destroyed");
        instance_destroy();
    }
}

