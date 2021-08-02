// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//for the move menu option, so that we dont need these in the events of the player
function select_move(){
	for (var i = 0; i < mov; i++) {
		if (keyboard_check(vk_down) || keyboard_check(ord("S"))) {
			move(directions.down);
		} else if (keyboard_check(vk_up) || keyboard_check(ord("W"))) {
			move(directions.up);
		} else if (keyboard_check(vk_left) || keyboard_check(ord("A"))) {
			move(directions.left);
		} else if (keyboard_check(vk_right) || keyboard_check(ord("D"))) {
			move(directions.right);
		} /*else if (keyboard_check(vk_anykey)) {
			return;
		}*/
	}
}