#region //Get Player Input
if (hascontrol)
{
key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));;
key_jump = keyboard_check_pressed(vk_space);

if (key_left) || (key_right) || (key_jump)
{
	controller = 0;
}

if (abs(gamepad_axis_value(0,gp_axislh)) > 0.2)
{
	key_left = abs(min(gamepad_axis_value(0,gp_axislh),0));
	key_right = max(gamepad_axis_value(0,gp_axislh),0);
	controller = 1;
}

if (gamepad_button_check_pressed(0,gp_face1))
{
		key_jump = 1;
		controller = 1;
}
}
else
{
	key_right = 0;
	key_left = 0;
	key_jump = 0;
}
#endregion


#region //Calculate Movement
var move = key_right - key_left;

hsp = move * walksp;

vsp = vsp + grv;

if (place_meeting(x,y+1,oWall)) and (key_jump)
{
	vsp = -7;
}
#endregion
#region //Horizontal Collision ? 26:00
if (place_meeting(x+hsp,y,oWall))
{
	while (!place_meeting(x+sign(hsp),y,oWall)) //Подходим как можно ближе //sign 1 or -1 or 0 // 
	{
		x = x + sign(hsp);
	}
	hsp = 0;	
}
x = x + hsp;
#endregion
#region //Vertical Collision 27:00
if (place_meeting(x,y+vsp,oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall)) //sign 1 or -1 or 0 // This function returns whether a number is positive, negative or neither and returns 1, -1, 0 respectively. For example - sign(458) will return 1, sign(-5) will return -1 and sign(0) will return 0.
	{
		y = y + sign(vsp);
	}
	vsp = 0;	
}
y = y + vsp;
#endregion
#region //Animation

if (!place_meeting(x,y+1,oWall))
{
	sprite_index = sPlayerA;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0; // One line statement
} 
else 
{
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = sPlayer;
	}
	else
	{
		sprite_index = sPlayerR;	
	}	
}

if (hsp != 0) image_xscale = sign(hsp);
#endregion
