// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function target(){
	
	//if (object_get_parent(self.object_index) == oPlayer) {
		draw_set_alpha(0.2);
		draw_circle(x + tile_half,y + tile_half, (tile_size * range),false);
	
		//looks at all enemies and check if theyre in range
		for (var i = 0; i < array_length(controller.enemy); i++) {
			show_debug_message(i);
			draw_line(x + tile_half,y + tile_half, controller.enemy[i].x + tile_half, controller.enemy[i].y + tile_half);
		
			//checks if object is in range
			if (point_distance(x + tile_half,y + tile_half, controller.enemy[i].x + tile_half, controller.enemy[i].y + tile_half) <= tile_size * range) {
				var _list = ds_list_create();
				var _num = collision_line_list(x + tile_half,y + tile_half, controller.enemy[i].x + tile_half, controller.enemy[i].y + tile_half, oEntity, false, true, _list, true);
			
				//checks if only one collision and if its parent is oEnemyParent
				if (_num == 1 && object_get_parent(_list[| 0].object_index) == oEnemyParent) {
					controller.enemy[i].targetAble = true;
					ds_list_destroy(_list);
					show_debug_message("obj in range and nothing in my way");
				} else {
					show_debug_message("something in my way");
					controller.enemy[i].targetAble = false;
					ds_list_destroy(_list);
				}
			}
		}
	
		draw_set_alpha(1);
	
	/*} else {
		for (var i = 0; i < array_length(controller.ally); i++) {
			//show_debug_message(i);
			draw_line(x + tile_half,y + tile_half, controller.ally[i].x + tile_half, controller.ally[i].y + tile_half);
		
			//checks if object is in range
			if (point_distance(x + tile_half,y + tile_half, controller.ally[i].x + tile_half, controller.ally[i].y + tile_half) <= tile_size * range) {
				var _list = ds_list_create();
				var _num = collision_line_list(x + tile_half,y + tile_half, controller.ally[i].x + tile_half, controller.ally[i].y + tile_half, oEntity, false, true, _list, true);
			
				//checks if only one collision and if its parent is oPlayer
				if (_num == 1 && object_get_parent(_list[| 0].object_index) == oPlayer) {
					controller.ally[i].targetAble = true;
					ds_list_destroy(_list);
					//show_debug_message("obj in range and nothing in my way");
				} else {
					//show_debug_message("something in my way");
					controller.ally[i].targetAble = false;
					ds_list_destroy(_list);
				}
			}
		}*/
	//}
}