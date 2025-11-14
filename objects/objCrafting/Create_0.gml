rowLength = 2;
global.craftInventory = array_create(CRAFTING_SLOTS, -1);
randomize();
for (i = 0; i < CRAFTING_SLOTS; i++) {
	global.craftInventory[i] = [-1, 0]; // itemID, itemCount
}
