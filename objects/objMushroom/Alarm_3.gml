if (poisoned) {
    enemyHealth -= poisonDamage;

    poisonTicks -= 1;

    if (enemyHealth <= 0) {
        instance_destroy();
        exit;
    }

    if (poisonTicks > 0) {
        alarm[3] = room_speed * 1;  // schedule next tick
    } else {
        poisoned = false;  // done
    }
}
