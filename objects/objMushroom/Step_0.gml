// VERY VERY simple monster, but we can add to it later

var dist = point_distance(x, y, objPlayer.x, objPlayer.y);
varBaitDist = 99999999999;
if(instance_exists(objBait)) {
	varBaitDist = point_distance(x, y, objBait.x, objBait.y);
}

if (state == "idle")
{
    hsp = 0;
    vsp = 0;


    if (dist < detect_range and objPlayer.invisible == false)
        state = "chase";
}

else if (state == "chase")
{
    if (instance_exists(objBait) && varBaitDist < 750) {
        // Move toward bait
        var dirBait = point_direction(x, y, objBait.x, objBait.y);
        hsp = lengthdir_x(enemySpeed, dirBait);
        vsp = lengthdir_y(enemySpeed, dirBait);
    }
    else
    {
        // Move toward player
        var dir = point_direction(x, y, objPlayer.x, objPlayer.y);
        hsp = lengthdir_x(enemySpeed, dir);
        vsp = lengthdir_y(enemySpeed, dir);
    }

    // Player escapes
    if (dist > giveup_range || objPlayer.invisible == true)
    {
        state = "idle";
        hsp = 0;
        vsp = 0;
    }
}

// Horizontal movement
if (!place_meeting(x + hsp, y, objMushroom))
    x += hsp;

// Vertical movement
if (!place_meeting(x, y + vsp, objMushroom))
    y += vsp;



