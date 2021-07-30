// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function userInterface(){
	draw_set_color(c_black);
	draw_rectangle(0 ,room_height - 100, room_width, room_height, false);
	
	draw_set_color(c_white);
	//draw_set_halign(fa_right);
	//draw_set_font(fn_text);
	
	if (global.has2players) {
		//2 Player UI Elements
		
		draw_set_halign(fa_right);
		
		//Healthbar - P2
		var diff = array_get(panel[uiPanel.healthbarp2],2) - array_get(panel[uiPanel.healthbarp2],0);
		var percent = diff * 1;
		//draw_rectangle_color(array_get(panel[uiPanel.healthbar],0),array_get(panel[uiPanel.healthbar],1),array_get(panel[uiPanel.healthbar],2),array_get(panel[uiPanel.healthbar],3),c_ltgray,c_ltgray,c_ltgray,c_ltgray,false);
		draw_rectangle(array_get(panel[uiPanel.healthbarp2],0) + ui.border,array_get(panel[uiPanel.healthbarp2],1) + ui.border, array_get(panel[uiPanel.healthbarp2],2) - ui.border, array_get(panel[uiPanel.healthbarp2],3) - ui.border, false);
		draw_rectangle_color(array_get(panel[uiPanel.healthbarp2],2) - percent + ui.border + 1,array_get(panel[uiPanel.healthbarp2],1) + ui.border + 1, array_get(panel[uiPanel.healthbarp2],2) - ui.border - 1, array_get(panel[uiPanel.healthbarp2],3) - ui.border - 1, c_blue, c_blue, c_blue, c_blue, false);
		draw_set_valign(fa_middle);
		draw_set_font(fn_bar);
		draw_text(array_get(panel[uiPanel.healthbarp2],2) - ui.border, array_get(panel[uiPanel.healthbarp1],1), "70/70 HP");
		
		//Inventory Slots - P2
		//draw_rectangle_color(array_get(panel[uiPanel.itemslotsp2],0),array_get(panel[uiPanel.itemslotsp2],1),array_get(panel[uiPanel.itemslotsp2],2),array_get(panel[uiPanel.itemslotsp2],3),c_red,c_red,c_red,c_red,false);
		draw_rectangle(array_get(panel[uiPanel.itemslotsp2], 0) + ui.border, array_get(panel[uiPanel.itemslotsp2], 1) + ui.border, array_get(panel[uiPanel.itemslotsp2], 2) - ui.border, array_get(panel[uiPanel.itemslotsp2], 3) - ui.border, true);
		draw_line(array_get(panel[uiPanel.itemslotsp2], 0) + ui.border + ui.invSlotSize, array_get(panel[uiPanel.itemslotsp2], 1) + ui.border - 1, array_get(panel[uiPanel.itemslotsp2], 0) + ui.border + ui.invSlotSize, array_get(panel[uiPanel.itemslotsp2], 3) - ui.border);
		draw_line(array_get(panel[uiPanel.itemslotsp2], 0) + ui.border + (ui.invSlotSize*2), array_get(panel[uiPanel.itemslotsp2], 1) + ui.border - 1, array_get(panel[uiPanel.itemslotsp2], 0) + ui.border + (ui.invSlotSize*2), array_get(panel[uiPanel.itemslotsp2], 3) - ui.border);
		
		//Actions - P2
		draw_set_valign(fa_top);
		draw_set_font(fn_text);
		//draw_rectangle_color(array_get(panel[uiPanel.actionsp2],0),array_get(panel[uiPanel.actionsp2],1),array_get(panel[uiPanel.actionsp2],2),array_get(panel[uiPanel.actionsp2],3),c_green,c_green,c_green,c_green,false);
		draw_text(array_get(panel[uiPanel.actionsp2],2) - ui.border, array_get(panel[uiPanel.actionsp2],1) + 0, "Attack");
		draw_text(array_get(panel[uiPanel.actionsp2],2) - ui.border, array_get(panel[uiPanel.actionsp2],1) + 15, "Items");
		draw_text(array_get(panel[uiPanel.actionsp2],2) - ui.border, array_get(panel[uiPanel.actionsp2],1) + 30, "Exit");
		
	}
	
	//Healthbar - P1
	var diff = array_get(panel[uiPanel.healthbarp1],2) - array_get(panel[uiPanel.healthbarp1],0);
	var percent = diff * 0.8;
	//show_debug_message(array_get(panel[uiPanel.healthbarp1],0) + percent - ui.border*2)
	//draw_rectangle_color(array_get(panel[uiPanel.healthbar],0),array_get(panel[uiPanel.healthbar],1),array_get(panel[uiPanel.healthbar],2),array_get(panel[uiPanel.healthbar],3),c_ltgray,c_ltgray,c_ltgray,c_ltgray,false);
	draw_rectangle(array_get(panel[uiPanel.healthbarp1],0) + ui.border,array_get(panel[uiPanel.healthbarp1],1) + ui.border, array_get(panel[uiPanel.healthbarp1],2) - ui.border, array_get(panel[uiPanel.healthbarp1],3) - ui.border, false);
	draw_rectangle_color(array_get(panel[uiPanel.healthbarp1],0) + ui.border + 1,array_get(panel[uiPanel.healthbarp1],1) + ui.border + 1, array_get(panel[uiPanel.healthbarp1],0) + percent - ui.border - 1, array_get(panel[uiPanel.healthbarp1],3) - ui.border - 1, c_red, c_red, c_red, c_red, false);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_set_font(fn_bar);
	draw_text(array_get(panel[uiPanel.healthbarp1],0) + ui.border, array_get(panel[uiPanel.healthbarp1],1), "40/50 HP");
	
	//Timeline - Scales to Player Count
	var middle = ui.top + ( (array_get(panel[uiPanel.timeline],3) - array_get(panel[uiPanel.timeline], 1))/2 );
	//draw_rectangle_color(array_get(panel[uiPanel.timeline],0),array_get(panel[uiPanel.timeline],1),array_get(panel[uiPanel.timeline],2),array_get(panel[uiPanel.timeline],3),c_blue,c_blue,c_blue,c_blue,false);
	draw_line(array_get(panel[uiPanel.timeline],0) + ui.border, middle, array_get(panel[uiPanel.timeline],2) - ui.border - 5, middle);
	draw_line(array_get(panel[uiPanel.timeline],0) + ui.border, middle - 7, array_get(panel[uiPanel.timeline],0) + ui.border, middle + 7);
	
	//Inventory Slots - P1
	//draw_rectangle_color(array_get(panel[uiPanel.itemslots],0),array_get(panel[uiPanel.itemslots],1),array_get(panel[uiPanel.itemslots],2),array_get(panel[uiPanel.itemslots],3),c_red,c_red,c_red,c_red,false);
	draw_rectangle(array_get(panel[uiPanel.itemslotsp1], 0) + ui.border, array_get(panel[uiPanel.itemslotsp1], 1) + ui.border, array_get(panel[uiPanel.itemslotsp1], 2) - ui.border, array_get(panel[uiPanel.itemslotsp1], 3) - ui.border, true);
	draw_line(array_get(panel[uiPanel.itemslotsp1], 0) + ui.border + ui.invSlotSize, array_get(panel[uiPanel.itemslotsp1], 1) + ui.border - 1, array_get(panel[uiPanel.itemslotsp1], 0) + ui.border + ui.invSlotSize, array_get(panel[uiPanel.itemslotsp1], 3) - ui.border);
	draw_line(array_get(panel[uiPanel.itemslotsp1], 0) + ui.border + (ui.invSlotSize*2), array_get(panel[uiPanel.itemslotsp1], 1) + ui.border - 1, array_get(panel[uiPanel.itemslotsp1], 0) + ui.border + (ui.invSlotSize*2), array_get(panel[uiPanel.itemslotsp1], 3) - ui.border);
	
	//Actions - P1
	//draw_rectangle_color(array_get(panel[uiPanel.actions],0),array_get(panel[uiPanel.actions],1),array_get(panel[uiPanel.actions],2),array_get(panel[uiPanel.actions],3),c_green,c_green,c_green,c_green,false);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	draw_set_font(fn_text);
	draw_text(array_get(panel[uiPanel.actionsp1],0) + ui.border, array_get(panel[uiPanel.actionsp1],1) + 0, "Attack");
	draw_text(array_get(panel[uiPanel.actionsp1],0) + ui.border, array_get(panel[uiPanel.actionsp1],1) + 15, "Items");
	draw_text(array_get(panel[uiPanel.actionsp1],0) + ui.border, array_get(panel[uiPanel.actionsp1],1) + 30, "Exit");
	
	//Score - Centered
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_font(fn_score);
	draw_text(ui.right/2,ui.top + 50, "Score : " + string(score));
	
}