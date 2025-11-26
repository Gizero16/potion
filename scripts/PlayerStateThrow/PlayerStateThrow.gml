function PlayerStateThrow() {

    // movement during throw windup
    hSpeed = lengthdir_x(inputMagnitude * throwSpeed, inputDirection);
    vSpeed = lengthdir_y(inputMagnitude * throwSpeed, inputDirection);

    PlayerCollision();

    if (inputMagnitude != 0)
        direction = inputDirection;

    var _total = sprite_get_number(sprite_index) / 4;

    // ----- PLAY ANIMATION -----
    if (localFrame < _total) {
        image_index = localFrame + (CARDINAL_DIR * _total);
        localFrame += sprite_get_speed(sprite_index) / FRAME_RATE;
        return; // keep playing animation
    }

    // ===== ANIMATION FINISHED =====

    // run this block ONE TIME
  if (!throwEffectDone) {

    var potion = throwItem;

    // effects...
    if (potion == 0) {
        if (health < objPlayer.hpMax ){
            if (health + 1 > objPlayer.hpMax) {
                health += 0.5;
            } else {
                health += 1;
            }
        }
		
		sprId = layer_sprite_create("Instances", objPlayer.x, objPlayer.y, sprHeal);
		alarm[0] = room_speed;
		
		
    }
    else if (potion == 1) {
        speedBoostTimer = room_speed * 5;
        walkSpeed *= 1.3;
		alarm[1] = speedBoostTimer
		
		sprId = layer_sprite_create("Instances", objPlayer.x, objPlayer.y, sprSpeed); // Using the same alarm as b4 because the player cant use 2 potions at a time
		alarm[0] = room_speed;
		
    }
    else if (potion == 8) {
        invisTimer = room_speed * 5;
        image_alpha = 0.4;
		invisible = true
		alarm[2] = invisTimer
		
		sprId = layer_sprite_create("Instances", objPlayer.x, objPlayer.y, sprInvis);
		alarm[0] = room_speed;
    }
    else {
        instance_create_layer(x, y, "potions", objPotion);
    }

    // ---- decrement item here ----
    global.handInventory[objHandForest.selected][1] -= 1;

    if (global.handInventory[objHandForest.selected][1] <= 0) {
        global.handInventory[objHandForest.selected][0] = -1;
        global.handInventory[objHandForest.selected][1] = 0;
        objHandForest.selected = -1;
    }

    throwEffectDone = true;
}


    // exit state when player releases throw key
    if (keyThrow) {
        throwEffectDone = false;
        state = PlayerStateFree;
    }
}
