// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function movement_step(){

// You can write your code in this editor
if (state == states.walking) {
	
	walk_anim_time += delta_time / 1000000;
	
	var t = walk_anim_time / walk_anim_length;
	
	if (t >= 1) {
		walk_anim_time = 0;
		t = 1;
		state = states.idle;
	}
	
	var _x = lerp(x_from, x_to, t);
	var _y = lerp(y_from, y_to, t);
	
	x = _x * tile_size;
	y = _y * tile_size;
}

timeline();