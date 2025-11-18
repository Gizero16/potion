// Damages the player on touch
show_debug_message("Touched player")
if (not other.invincible){	
health -= enemyDamage;
show_debug_message("Damaged Player")
other.invincible = true
alarm[0] = attackCooldown
if (health <= 0) {
	room_restart()
}

}

