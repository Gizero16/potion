function chunk_grid_init(){
	
	// === WORLD CONSTANTS ===
	chunk_cols = 5;
	chunk_rows = 5;
	chunk_w_tiles = 24;
	chunk_h_tiles = 24;
	tile_size = 64;

	chunk_w_px = chunk_w_tiles * tile_size; // 1536 px
	chunk_h_px = chunk_h_tiles * tile_size; // 1536 px

	// === CHUNK GRID ===
	// Create a 5×5 grid, where each cell stores a chunk struct
	global.chunk_grid = ds_grid_create(chunk_cols, chunk_rows);

	for (var j = 0; j < chunk_rows; j++)
	{
		for (var i = 0; i < chunk_cols; i++)
		{
		    var chunk_id = j * chunk_cols + i;
		
			var tile_grid = ds_grid_create(chunk_w_tiles, chunk_h_tiles);
			ds_grid_clear(tile_grid, 0); // initialize all cells to empty (0)
	
		    var chunk_info = {
		        cID: chunk_id,
		        grid_x: i,
		        grid_y: j,
		        world_x: i * chunk_w_px,
		        world_y: j * chunk_h_px,
				cTiles: tile_grid,
				biome: "filler_biome",
		        generated: false
		    };
		
			if (chunk_info.cID == 12) 
				chunk_info.biome = "main_biome";
			
		    global.chunk_grid[# i, j] = chunk_info;
		}
	}
	
	assign_biome();
	
	// === PREFAB LIBRARY ===
	//tilesets();
}