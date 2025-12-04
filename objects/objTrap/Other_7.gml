if(sprite_index == sprTrapAttack) {
 sprite_index = sprTrapIdle
 image_index = 0;
 return;
}

if(sprite_index == sprTrapIdle) {
instance_destroy();
}