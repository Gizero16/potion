// here u would have it check what kind of potion it is and ensure that the potion damages the enemy in the right way
// but for now its just gonna damage the enemy by 1

other.enemyHealth -= 1;

if (other.enemyHealth <= 0) {
instance_destroy(other);
}

objPlayer.createOnce = true
instance_destroy()