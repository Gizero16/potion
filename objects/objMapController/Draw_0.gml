// === DEBUG: DRAW CHUNK BORDERS ===
draw_set_color(c_black);
draw_set_alpha(0.6);

for (var j = 0; j < chunk_rows; j++)
for (var i = 0; i < chunk_cols; i++)
{
    var chunk = global.chunk_grid[# i, j];

    var x1 = chunk.world_x;
    var y1 = chunk.world_y;
    var x2 = x1 + chunk_w_px;
    var y2 = y1 + chunk_h_px;

    // Draw the outer border rectangle
    draw_rectangle(x1, y1, x2, y2, true);

    draw_text(x1 + 8, y1 + 8, "Chunk " + string(chunk.cID) + "\nChunk_x y: " + string(x1) + " " + string(y1)  + "\nChunk_x2 y2: " + string(x2) + " " + string(y2) + "\nBiome: " + string(chunk.biome));
}

// reset draw settings
draw_set_alpha(1);