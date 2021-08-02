/// @description Insert description here
// You can write your code in this editor



//if mouse_check_button_pressed(mb_left) && place_meeting(mouse_x, mouse_y, oPlayer) {
if keyboard_check(vk_escape) {
	//show_debug_message("i was clicked");
	moveMe = true;
}


	if (moveMe && myTurn) {
	show_debug_message("i want to move");
	var counter = 1;
	while (counter <= mov) {
		if (keyboard_check(vk_down)) {
			show_debug_message("down");
			move(directions.down);
			counter++;
				
		} else if (keyboard_check(vk_up)) {
			show_debug_message("up");
			move(directions.up);
			counter++;
				
		} else if (keyboard_check(vk_left)) {
			show_debug_message("left");
			move(directions.left);
			counter++;
				
		} else if (keyboard_check(vk_right)) {
			show_debug_message("right");
			move(directions.right);
			counter++;
				
		} /*else if (keyboard_check(vk_anykey)) {
			return;
		}*/
		
	}
	useTurn();
}



if keyboard_check(vk_f1) {
	useTurn();
}

// Inherit the parent event
event_inherited();

moveMe = false;

