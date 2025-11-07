function tilesets_init()
{
    global.biome_tilesets = {
        // ---------------- CINDER ----------------
        cinder_biome: {
            small: [
                { obj: obj_rock, width: 1, height: 1 },
                { obj: obj_burnt_bush, width: 1, height: 1 }
            ],
            medium: [
                { obj: obj_charred_log, width: 2, height: 1 }
            ],
            large: [
                { obj: obj_lava_pool, width: 3, height: 3 }
            ],
            ingredients: [
                { obj: obj_cinder_twig, width: 1, height: 1 }
            ]
        },

        // ---------------- LILY ----------------
        lily_biome: {
            small: [
                { obj: obj_reed, width: 1, height: 1 },
                { obj: obj_pebble, width: 1, height: 1 }
            ],
            medium: [
                { obj: obj_log_bridge, width: 2, height: 1 }
            ],
            large: [
                { obj: obj_pond, width: 3, height: 3 }
            ],
            ingredients: [
                { obj: obj_hydration_lily, width: 1, height: 1 }
            ]
        },

        // ---------------- NECTAR ----------------
        nectar_biome: {
            small: [
                { obj: obj_flower_small, width: 1, height: 1 },
                { obj: obj_rock, width: 1, height: 1 }
            ],
            medium: [
                { obj: obj_flower_cluster, width: 2, height: 2 }
            ],
            large: [
                { obj: obj_hive_grove, width: 3, height: 2 }
            ],
            ingredients: [
                { obj: obj_nectar_fruit, width: 1, height: 1 }
            ]
        },

        // ---------------- MUSHROOM ----------------
        mushroom_biome: {
            small: [
                { obj: obj_mushroom_small, width: 1, height: 1 },
                { obj: obj_log, width: 2, height: 1 } // acts like small footprint if you want
            ],
            medium: [
                { obj: obj_mushroom_cluster, width: 2, height: 2 }
            ],
            large: [
                { obj: obj_cap_colossus, width: 3, height: 3 }
            ],
            ingredients: [
                { obj: obj_poison_mushroom, width: 1, height: 1 }
            ]
        },

        // ---------------- ATTRACTIS ----------------
        attractis_biome: {
            small: [
                { obj: obj_crystal_shard, width: 1, height: 1 },
                { obj: obj_pebble, width: 1, height: 1 }
            ],
            medium: [
                { obj: obj_crystal_cluster, width: 2, height: 2 }
            ],
            large: [
                { obj: obj_geode_field, width: 3, height: 2 }
            ],
            ingredients: [
                { obj: obj_attractis, width: 1, height: 1 }
            ]
        },

        // ---------------- WILLOW ----------------
        willow_biome: {
            small: [
                { obj: obj_rock_mossy, width: 1, height: 1 },
                { obj: obj_shrub, width: 1, height: 1 }
            ],
            medium: [
                { obj: obj_willow_sapling, width: 2, height: 2 }
            ],
            large: [
                { obj: obj_willow_tree, width: 3, height: 3 }
            ],
            ingredients: [
                { obj: obj_dreamy_willow, width: 1, height: 1 }
            ]
        },

        // ---------------- FILLER ----------------
        filler_biome: {
            small: [
                { obj: obj_grass_tuft, width: 1, height: 1 },
                { obj: obj_pebble, width: 1, height: 1 }
            ],
            medium: [
                { obj: obj_log, width: 2, height: 1 }
            ],
            large: [
                // keep empty or minimal for more walkable hub space
            ]
        }
    };
	
	
	
	function get_biome_tilesets(biome_name)
	{
	    return variable_struct_get(global.biome_tilesets, biome_name);
	}
}