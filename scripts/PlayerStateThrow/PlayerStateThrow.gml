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

  if (!throwEffectDone) {

    var potion = throwItem;

    if (potion == 0) { // regen potion
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
    else if (potion == 1) { // Speed
        speedBoostTimer = room_speed * 5;
        walkSpeed *= 1.3;
		alarm[1] = speedBoostTimer
		
		sprId = layer_sprite_create("Instances", objPlayer.x, objPlayer.y, sprSpeed); // Using the same alarm as b4 because the player cant use 2 potions at a time
		alarm[0] = room_speed;
		
    }
    else if (potion == 8) { // Invis
        invisTimer = room_speed * 5;
        image_alpha = 0.4;
		invisible = true
		alarm[2] = invisTimer
		
		sprId = layer_sprite_create("Instances", objPlayer.x, objPlayer.y, sprInvis);
		alarm[0] = room_speed;
    }
	// THROWABLE POTIONS
    else if (potion == 4) { // Explosive
        instance_create_layer(x, y, "potions", objExplosionPotion);
    } else if (potion == 7) { // Sleepy
		instance_create_layer(x, y, "potions", objSleepPotion);
	} else if( potion ==  2) { // Poison
		instance_create_layer(x, y, "potions", objPoisonPotion);
	}
	// PLANTABLE POTIONS
	else if (potion == 3){
	show_debug_message("Trap potion created!")
	instance_create_layer(x, y, "Instances", objTrap);
	// play plant animation here
	} else if (potion == 6) {
		instance_create_layer(x, y, "Instances", objPet);
	} else if (potion == 5) {
		instance_create_layer(x, y, "Instances", objBait)
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
