vsp = vsp + grv;

//Horizontal Collision ? 26:00
if (place_meeting(x+hsp,y,oWall))
{
	while (!place_meeting(x+sign(hsp),y,oWall)) //Подходим как можно ближе //sign 1 or -1 or 0 // 
	{
		x = x + sign(hsp);
	}
	hsp = -hsp;	
}
x = x + hsp;

//Vertical Collision 27:00
if (place_meeting(x,y+vsp,oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall)) //sign 1 or -1 or 0 // This function returns whether a number is positive, negative or neither and returns 1, -1, 0 respectively. For example - sign(458) will return 1, sign(-5) will return -1 and sign(0) will return 0.
	{
		y = y + sign(vsp);
	}
	vsp = 0;	
}
y = y + vsp;

//Animation

if (!place_meeting(x,y+1,oWall))
{
	sprite_index = sEnemyA;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0; // One line statement
} 
else 
{
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = sEnemy;
	}
	else
	{
		sprite_index = sEnemyR;	
	}	
}

if (hsp != 0) image_xscale = sign(hsp);