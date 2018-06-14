if (done == 0)
{
	vsp = vsp + grv;

	//Horizontal Collision ? 26:00
	if (place_meeting(x+hsp,y,oWall))
	{
		while (!place_meeting(x+sign(hsp),y,oWall)) //Подходим как можно ближе //sign 1 or -1 or 0 // 
		{
			x = x + sign(hsp);
		}
		hsp = 0;	
	}
	x = x + hsp;

	//Vertical Collision 27:00
	if (place_meeting(x,y+vsp,oWall))
	{
		if (vsp > 0) 
		{
			done = 1;
			image_index = 1;
		}
		while (!place_meeting(x,y+sign(vsp),oWall)) //sign 1 or -1 or 0 // This function returns whether a number is positive, negative or neither and returns 1, -1, 0 respectively. For example - sign(458) will return 1, sign(-5) will return -1 and sign(0) will return 0.
		{
			y = y + sign(vsp);
		}
		vsp = 0;	
	}
	y = y + vsp;
}