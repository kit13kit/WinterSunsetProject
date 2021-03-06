if (global.pause)
{
	image_speed = 0;
	exit;
}

//Get player inputs
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

//Calculate movement
var _move = key_right - key_left;

hsp = _move * walksp;

vsp += grv;

if (place_meeting(x,y+1,spr_floor)) && (key_jump){
	vsp = -jumpsp;
}

//Horizontal collision
if (place_meeting(x+hsp,y,obj_floor)){
	while(!place_meeting(x+sign(hsp),y,obj_floor)){
		x += sign(hsp);
	}
	hsp = 0;
}
x += hsp;

//Vertical collision
if (place_meeting(x,y+vsp,obj_floor)){
	while(!place_meeting(x,y+sign(vsp),obj_floor)){
		y += sign(vsp);
	}
	vsp = 0;
}
y += vsp;

//Change direction && walk
image_speed = 0;

if(key_left){
	image_xscale = -1;
	image_speed = 1;
}
else if(key_right){
	image_xscale = 1;
	image_speed = 1;
}
else{
	image_index = 0;
}
