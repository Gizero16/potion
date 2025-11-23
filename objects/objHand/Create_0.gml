rowLength = 4;
global.handInventory = array_create(HAND_SLOTS, -1);
randomize();
for (i = 0; i < HAND_SLOTS; i++) {
	global.handInventory[i] = [-1, 0] // itemID, itemCount
}

global.handInventory[0] = [0, 1]
global.handInventory[1] = [1, 1]
global.handInventory[2] = [8, 2]