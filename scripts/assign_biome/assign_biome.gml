function assign_biome() {
	
	// Randomize the RNG seed
	//random_set_seed();
    randomize();
	
	
	var biome_list = [
	    "cinder_biome",
	    "lily_biome",
	    "nectar_biome",
	    "mushroom_biome",
	    "attractis_biome",
	    "willow_biome",
		"filler_biome"
	];
	
	var randomize_biome = array_create(25); //array from 0-24 (# of chunks) to be randomized
	var random_biome_list = array_create(6); // the first 6 (# of biomes) numbers of randomize_biome
	for (var i = 0; i < 25; i++)
	    randomize_biome[i] = i; // set array values from 0 - 24

	// shuffle the array
	randomize_biome = array_shuffle(randomize_biome);
	
	picked_center = true; // checks to see if the first 6 numbers are the center tile (12)
	while (picked_center) {
		randomize_biome = array_shuffle(randomize_biome);
		picked_center = false;      // end while loop if center wasn't picked in first 6 numbers
		for (var n = 0; n < 6; n++) // checks to see if the first 6 numbers are the center tile (12)
		{
			if (randomize_biome[n] == 12)
				picked_center = true;
		}
	}
	array_copy(random_biome_list, 0, randomize_biome, 0, 6)     //shorten array
	show_debug_message("Chosen: " + string(random_biome_list));
	
	for (var k = 0; k < 6; k++) {
		var cID = random_biome_list[k];   // chunkID for the 6 random biomes we picked
        var biome_name = biome_list[k];   // names of the biomes in order

        var j = floor(cID / 5); //clever math to get the coordinates of the chunk by the cID (5x5 grid)
        var i = cID mod 5;
		
		var chunk = global.chunk_grid[# i, j]; //temporarily 
        chunk.biome = biome_name;
		global.chunk_grid[# i, j] = chunk;
	}
	
	//generate_chunk();
}