function EnemyCollision(){
    var _collision = false;

    // Horizontal
    if (tilemap_get_at_pixel(objPlayer.collisionMap, x + hSpeed, y)) {
        x -= x mod TILE_SIZE;
        if (sign(hSpeed) == 1) x += TILE_SIZE - 1;
        hSpeed = 0;
        _collision = true;
    }

    // Vertical
    if (tilemap_get_at_pixel(objPlayer.collisionMap, x, y + vSpeed)) {
        y -= y mod TILE_SIZE;
        if (sign(vSpeed) == 1) y += TILE_SIZE - 1;
        vSpeed = 0;
        _collision = true;
    }

    x += hSpeed;
    y += vSpeed;

    return _collision;
}
