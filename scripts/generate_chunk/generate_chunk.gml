function generate_chunk()
{
    for (var j = 0; j < chunk_rows; j++)
    for (var i = 0; i < chunk_cols; i++)
    {
        var chunk = global.chunk_grid[# i, j];

        switch (chunk.biome)
        {
            case "main_biome":
                generate_border(chunk);
                break;

            case "cinder_biome":
                generate_border(chunk);
                break;

            case "lily_biome":
                generate_border(chunk);
                break;

            case "nectar_biome":
                generate_border(chunk);
                break;

            case "mushroom_biome":
                generate_border(chunk);
                break;

            case "attractis_biome":
                generate_border(chunk);
                break;

            case "willow_biome":
                generate_border(chunk);
                break;

            default:
                generate_border(chunk);
                break;
        }

        // Mark it as generated and store it back
        chunk.generated = true;
        global.chunk_grid[# i, j] = chunk;
    }
}