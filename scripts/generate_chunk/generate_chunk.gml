function generate_chunk()
{
    for (var j = 0; j < chunk_rows; j++)
    for (var i = 0; i < chunk_cols; i++)
    {
        var chunk = global.chunk_grid[# i, j];

        switch (chunk.biome)
        {
            case "main_biome":
                generate_main_biome(chunk);
                break;

            case "cinder_biome":
                generate_cinder_biome(chunk);
                break;

            case "lily_biome":
                generate_lily_biome(chunk);
                break;

            case "nectar_biome":
                generate_nectar_biome(chunk);
                break;

            case "mushroom_biome":
                generate_mushroom_biome(chunk);
                break;

            case "attractis_biome":
                generate_attractis_biome(chunk);
                break;

            case "willow_biome":
                generate_willow_biome(chunk);
                break;

            default:
                generate_filler_biome(chunk);
                break;
        }

        // Mark it as generated and store it back
        chunk.generated = true;
        global.chunk_map[# i, j] = chunk;
    }
}