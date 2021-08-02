/// @description 60 Frames per Second

inputP1[playerInput.up]		= keyboard_check_pressed( ord("W") );
inputP1[playerInput.left]	= keyboard_check_pressed( ord("A") );
inputP1[playerInput.down]	= keyboard_check_pressed( ord("S") );
inputP1[playerInput.right]	= keyboard_check_pressed( ord("D") );
inputP1[playerInput.enter]	= keyboard_check_pressed( vk_space );

inputP2[playerInput.up]		= keyboard_check_pressed( vk_up    );
inputP2[playerInput.left]	= keyboard_check_pressed( vk_left  );
inputP2[playerInput.down]	= keyboard_check_pressed( vk_down  );
inputP2[playerInput.right]	= keyboard_check_pressed( vk_right );
inputP2[playerInput.enter]	= keyboard_check_pressed( vk_enter );


//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
switch(global.game) {
	case gameState.battle:
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	
	//Player 1
	if (p1_menu) {
		if			( inputP1[playerInput.up] ) {
			if (menu_option == 0) { menu_option = 2; } else { menu_option-- }
		} else if	( inputP1[playerInput.down] ) {
			if (menu_option == 2) { menu_option = 0; } else { menu_option++ }
		} else if	( inputP1[playerInput.enter] ) {
			switch (menu_option) {
				case 0:
				show_debug_message("Attack!")
				break;
				case 1:
				show_debug_message("Items!")
				break;
				case 2:
				p1_menu = false
				break;
			}
		}
	} else {
		if			( inputP1[playerInput.up] ) {
			with(ally[p1]) move(directions.up);
		} else if	( inputP1[playerInput.left] ) {
			with(ally[p1]) move(directions.left);
		} else if	( inputP1[playerInput.down] ) {
			with(ally[p1]) move(directions.down);
		} else if	( inputP1[playerInput.right] ) {
			with(ally[p1]) move(directions.right);
		} else if	( inputP1[playerInput.enter] ) {
			if (ally[p1].myTurn) {
				p1_menu = true;
			}
		}
	}

	
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	break;
	case gameState.path:
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	
	//Code goes here.
	
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	break;
}
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-