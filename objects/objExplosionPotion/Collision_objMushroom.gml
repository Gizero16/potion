// Checks what kind of throwable potion it is, then does that effect to the enemy


if (object_index == objExplosionPotion) {

    other.enemyHealth -= 3;

    if (other.enemyHealth <= 0) {
        instance_destroy(other);
    }

    instance_create_layer(x, y, "Instances", objExplosion);

} 
else if (object_index == objSleepPotion) {

    with (other) {
        if (!sleeping) {
            sleeping = true;
            sleepReturnSpeed = enemySpeed;
            enemySpeed = 0;
            alarm[2] = room_speed * 8;
        }
    }
	instance_create_layer(x, y, "Instances", objSleep)

} 
else if (object_index == objPoisonPotion) {
    with (other) {
        if (!poisoned) {
            poisoned = true;
            poisonTicks = 5;
            poisonDamage = 0.5;
            alarm[3] = room_speed * 1;

            // Create the cloud and store its ID
            poisonCloud = instance_create_layer(x, y, "Instances", objPoison);
            poisonCloud.target = id; // tell cloud which enemy to follow
        }
    }
}



objPlayer.createOnce = true;
instance_destroy();
