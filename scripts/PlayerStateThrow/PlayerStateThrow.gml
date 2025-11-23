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
		layer_sprite_create("Instances", objPlayer.x, objPlayer.y, sprHeal)
    }
    else if (potion == 1) {
        speedBoostTimer = room_speed * 5;
        walkSpeed *= 1.5;
    }
    else if (potion == 8) {
        invisTimer = room_speed * 5;
        image_alpha = 0.4;
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
