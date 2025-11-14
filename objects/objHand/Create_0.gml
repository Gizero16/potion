rowLength = 3;
global.handInventory = array_create(HAND_SLOTS, -1);
randomize();
for (i = 0; i < HAND_SLOTS; i++) {
	global.handInventory[i] = [-1, 0] // itemID, itemCount
}
for (i = 0; i < HAND_SLOTS; i++) {
	global.handInventory[i] = [-1, 0] // itemID (-1 is empty), itemCount 
	global.handInventory[i][0] = round(random_range(-1, 14))
	global.handInventory[i][1] = round(random_range(1, 16))
}