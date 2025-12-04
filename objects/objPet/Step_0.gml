if(instance_exists(objMushroom)) {
var dist = point_distance(x, y, objMushroom.x, objMushroom.y);
if (dist < detectionDist) {
	sprite_index = sprPetAttack
	if (not cooldown) {
		show_debug_message("FIRING!")
		instance_create_layer(x, y, "Instances", objBullet);
		cooldown = true;
		alarm[0] = room_speed * 1.5
	}
} else {
	sprite_index = sprPetIdle
}

}

