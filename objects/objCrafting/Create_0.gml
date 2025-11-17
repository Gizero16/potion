rowLength = 2;
numRecipes= 8; // excluding end game items for now
global.craftInventory = array_create(CRAFTING_SLOTS, -1);
randomize();
for (i = 0; i < CRAFTING_SLOTS; i++) {
	global.craftInventory[i] = [-1, 0]; // itemID, itemCount
}

recipes = array_create(numRecipes, -1);
recipes[0] = [12, 15] // regen
recipes[1] = [11, 12] // speed
recipes[2] = [11, 13] // poison
recipes[3] = [13, 14] // trap
recipes[4] = [10, 13] // explosion
recipes[5] = [10, 14] // bait
recipes[6] = [12, 14] // pet
recipes[7] = [10, 15] // sleep
recipes[8] = [11, 15] // invis

