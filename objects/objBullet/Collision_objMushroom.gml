other.enemyHealth -= 0.75
if (other.enemyHealth <= 0){
instance_destroy(other);
instance_destroy();
}
instance_destroy();