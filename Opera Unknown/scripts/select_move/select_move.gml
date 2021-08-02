// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//for the move menu option, so that we dont need these in the events of the player
function select_move() {
	if(myTurn) {
		show_debug_message("im starting select_move");
		show_debug_message("im in the with statement");
		var counter = 0;
		while (counter < mov) {
			if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
				show_debug_message("down");
				move(directions.down);
				counter++;
				
			} else if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
				show_debug_message("up");
				move(directions.up);
				counter++;
				
			} else if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"))) {
				show_debug_message("left");
				move(directions.left);
				counter++;
				
			} else if (keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"))) {
				show_debug_message("right");
				move(directions.right);
				counter++;
				
			} /*else if (keyboard_check_pressed(vk_anykey)) {
				return;
			}*/
		}
		
		useTurn();
		
	}
}