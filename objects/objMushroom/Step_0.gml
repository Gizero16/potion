// VERY VERY simple monster, but we can add to it later

var dist = point_distance(x, y, objPlayer.x, objPlayer.y);


if (state == "idle")
{
    hsp = 0;
    vsp = 0;


    if (dist < detect_range)
        state = "chase";
}

else if (state == "chase")
{
    // Move toward player
    var dir = point_direction(x, y, objPlayer.x, objPlayer.y);
    hsp = lengthdir_x(enemySpeed, dir);
    vsp = lengthdir_y(enemySpeed, dir);

    // Player escapes
    if (dist > giveup_range)
    {
        state = "idle";
        hsp = 0;
        vsp = 0;
    }
}


x += hsp;
y += vsp;
