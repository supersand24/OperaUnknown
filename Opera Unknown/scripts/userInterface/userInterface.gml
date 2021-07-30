// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function userInterface(){
	draw_set_color(c_black);
	draw_rectangle(0 ,room_height - 100, room_width, room_height, false);
	
	if (global.has2players) {
		//2 Player UI Elements
	} else {
		//1 Player UI Elements
		
		var panelTop = room_height - 100;
		var panelBottom = room_height;
		var panelLeft = 0;
		var panelRight = room_width;
		
		var border = 0;
		
		var invSlotSize = 20;
		
		//[Left, Top, Right, Bottom, Border]
		var panel_healthbar = [panelLeft,panelTop + 80,panelRight,panelBottom,5];
		var panel_timeline = [panelLeft + (invSlotSize*3) + 15, panelTop + 15, panelRight - 15, panelTop + 15,5];
		var panel_itemslots = [0,0,0,0,0];
		var panel_actions = [0,0,0,0,0];
		//var panel_healthbar = [0,0,0,0,0];
		//var panel_healthbar = [0,0,0,0,0];
		//var panel_healthbar = [0,0,0,0,0];
		
		var invSlotSize = 20;
		
		draw_set_color(c_white);
		
		//Healthbar
		border = array_get(panel_healthbar,4);
		draw_rectangle(array_get(panel_healthbar,0) + border,array_get(panel_healthbar,1) + border, array_get(panel_healthbar,2) - border, array_get(panel_healthbar,3) - border, false);
		
		//Timeline
		border = border = array_get(panel_timeline,4);
		//draw_line(panelLeft + (invSlotSize*3) + 15,panelTop + 15, panelRight - 20, panelTop + 15);
		draw_line(array_get(panel_timeline,0) + border,array_get(panel_timeline,1) + border, array_get(panel_timeline,2) - border - 5, array_get(panel_timeline,3) + border);
		draw_line(panelLeft + (invSlotSize*3) + 15, panelTop + 8, panelLeft + (invSlotSize*3) + 15, panelTop + 22);
		
		//Inventory Slots
		draw_rectangle(panelLeft + 5, panelTop + 5, panelLeft + (invSlotSize*3) + 5, panelTop + invSlotSize + 5, true);
		draw_line(panelLeft + invSlotSize + 5, panelTop + 4, panelLeft + invSlotSize + 5, panelTop + invSlotSize + 5);
		draw_line(panelLeft + (invSlotSize*2) + 5, panelTop + 4, panelLeft + (invSlotSize*2) + 5, panelTop + invSlotSize + 5);
		
		//Score
		draw_set_halign(fa_center);
		draw_set_valign(fa_top);
		draw_set_font(fn_score);
		draw_text(room_width/2,panelTop + 50, "Score : " + string(score));
	}
	
}