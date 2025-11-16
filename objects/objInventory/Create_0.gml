rowLength = 3;

global.inventory = array_create(INVENTORY_SLOTS, -1);
	randomize();
	for (i = 0; i < INVENTORY_SLOTS; i++) {
		global.inventory[i] = [-1, 0] // itemID (-1 is empty), itemCount 
		
	}
	
	for(i = 0; i < 8; i++) {
	global.inventory[i][0] = round(random_range(10, 14))
	global.inventory[i][1] = 5
	}
	
	
