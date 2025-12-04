rowLength = 4;
global.handInventory = array_create(HAND_SLOTS, -1);
randomize();
for (i = 0; i < HAND_SLOTS; i++) {
	global.handInventory[i] = [-1, 0] // itemID, itemCount
}

global.handInventory[0] = [4, 10]
global.handInventory[1] = [5, 10]
global.handInventory[2] = [6, 10]
global.handInventory[3] = [3, 10]
