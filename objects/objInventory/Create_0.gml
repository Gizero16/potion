#macro INVENTORY_SLOTS 15
rowLength = 3;
inventory = array_create(INVENTORY_SLOTS, -1);
// potion info logic
// TODO: Create an array that stores each potion from 0-10
// Each item in array looks like this {"PotionName" , "Potion Description" }
// When hovering over slot, check if empty
// if not empty, compare inventory slot to potion array
// display potion array using draw event
// quit when mouse hovers or drags.
randomize();
inventory[0] = 1;
inventory[1] = 3*12;
inventory[2] = 5*12;