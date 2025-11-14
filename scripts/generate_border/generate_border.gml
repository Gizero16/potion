function generate_border(chunk) {
	var chunk_info = chunk;
	tilemap_id = layer_tilemap_get_id(layer_get_id("GroundTiles"))
	
	show_debug_message("Generating border for chunk ID: " + string(chunk.cID)
        + " | Biome: " + string(chunk.biome)
        + " | Layer: GroundTiles"
        + " | Tilemap ID: " + string(tilemap_id));
	
	for (i = chunk.world_x; i < chunk.world_x + 1536; i += 64) 
	{
		for (j = chunk.world_y; j < chunk.world_y + 1536; j += 64) 
		{
			var tile_x = (i - chunk.world_x) div 64; //tile_grid x coordinate
			var tile_y = (j - chunk.world_y) div 64; //tile_grid y coordinate
			
			var is_border = (tile_x == 0) || (tile_y == 0) || (tile_x == 23) || (tile_y == 23);
			
			if (is_border) 
			{
				var border_depth = irandom_range(1, 3); // how many grass tiles deep
                var dir_x = (tile_x == 0) ? 1 : (tile_x == 23 ? -1 : 0); // left edge -> draw to the right, right edge -> draw to the left
				var dir_y = (tile_y == 0) ? 1 : (tile_y == 23 ? -1 : 0); // top edge -> draw downward, bottom edge -> draw upward
				
				for (var k = 0; k < border_depth; k++)
                {
                    var tile_x_coord = i + dir_x * 64 * k;
                    var tile_y_coord = j + dir_y * 64 * k;

					show_debug_message(tilemap_set_at_pixel(tilemap_id, 1, tile_x_coord, tile_y_coord));
					show_debug_message("Placing tile at " + string(tile_x_coord) + "," + string(tile_y_coord));
				}
			}

		}
	}
}