#macro INVENTORY_SLOTS 15
rowLength = 3;
global.inventory = array_create(INVENTORY_SLOTS, -1);
randomize();
for (i = 0; i < INVENTORY_SLOTS; i++) {
	global.inventory[i] = [-1, 0] // itemID, itemCount -1 is empty
	global.inventory[i][0] = round(random_range(-1, 14))
	global.inventory[i][1] = round(random_range(1, 16))
}
