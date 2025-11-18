// This event mainly tries to prevent overlap

var dir;
var move_dis = 32;

if (x== other.x && y == other.y){
	dir = random(360)
} else {
	dir = point_direction(other.x, other.y, x, y)
}

var dx = lengthdir_x(move_dis,dir);
var dy = lengthdir_y(move_dis,dir);

if (!place_meeting(x+dx,y,object1)) x += dx;
if (!place_meeting(x,y+dy,object1)) y += dy;
if (!place_meeting(x+dx,y,char)) x +=dx;
if (!place_meeting(x,y+dy,char)) y += dy;