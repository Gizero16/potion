
if(instance_exists(objPoison)){
if (objPoison != noone) {
    instance_destroy(poisonCloud);
}
}

instance_create_layer(x, y, "Instances", objDeath);