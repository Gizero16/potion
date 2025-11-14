state = PlayerStateFree;

collisionMap = layer_tilemap_get_id(layer_get_id("Collision"));

image_speed = 0;
hSpeed = 0;
vSpeed = 0;
walkSpeed = 6;


spriteRun = spr_player_run;
spriteIdle = spr_player;
localFrame = 0;

throwSpeed = 2;
distanceThrow = 20;
spriteThrow = spr_player_throw;
throwCooldown = false;
createOnce = true;

hp = 3; 