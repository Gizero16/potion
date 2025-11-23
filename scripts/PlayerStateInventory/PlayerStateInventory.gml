function PlayerStateInventory(){
	inventoryOpen = true;
	if (createOnce) {
		// reminder to pause game here when the inventory is open
		instance_create_layer(320, 416, "Instances", objInventoryForest);
		createOnce = false;
	}
	
	if (keyboard_check_pressed(ord("E"))) {
		instance_destroy(objInventoryForest);
		createOnce = true;
		inventoryOpen = false;
		state = PlayerStateFree;
	}
}