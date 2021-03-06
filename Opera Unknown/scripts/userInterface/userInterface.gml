// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function userInterface(){
	
	draw_set_color(c_black);
	draw_rectangle(ui.left ,ui.top, ui.right, ui.bottom, false);
	draw_set_color(c_white);
	
	if (global.has2players) {
		//2 Player UI Elements
		
		draw_set_halign(fa_right);
		
		//Healthbar - P2
		//Add to array?
		var healthbarLength = array_get(panel[uiPanel.healthbarp2],2) - array_get(panel[uiPanel.healthbarp2],0);
		var healthbarPercent = healthbarLength * (ally[p2].hp / ally[p2].max_hp);
		//draw_rectangle_color(array_get(panel[uiPanel.healthbar],0),array_get(panel[uiPanel.healthbar],1),array_get(panel[uiPanel.healthbar],2),array_get(panel[uiPanel.healthbar],3),c_ltgray,c_ltgray,c_ltgray,c_ltgray,false);
		draw_rectangle(array_get(panel[uiPanel.healthbarp2],0) + ui.border,array_get(panel[uiPanel.healthbarp2],1) + ui.border, array_get(panel[uiPanel.healthbarp2],2) - ui.border, array_get(panel[uiPanel.healthbarp2],3) - ui.border, false);
		draw_rectangle_color(array_get(panel[uiPanel.healthbarp2],2) - healthbarPercent + ui.border + 1,array_get(panel[uiPanel.healthbarp2],1) + ui.border + 1, array_get(panel[uiPanel.healthbarp2],2) - ui.border - 1, array_get(panel[uiPanel.healthbarp2],3) - ui.border - 1, c_blue, c_blue, c_blue, c_blue, false);
		draw_set_valign(fa_middle);
		draw_set_font(fn_bar);
		draw_text(array_get(panel[uiPanel.healthbarp2],2) - ui.border, array_get(panel[uiPanel.healthbarp1],1), string(ally[p2].hp) + "/" + string(ally[p2].hp) + " HP");
		
		//Inventory Slots - P2
		//draw_rectangle_color(array_get(panel[uiPanel.itemslotsp2],0),array_get(panel[uiPanel.itemslotsp2],1),array_get(panel[uiPanel.itemslotsp2],2),array_get(panel[uiPanel.itemslotsp2],3),c_red,c_red,c_red,c_red,false);
		draw_rectangle(array_get(panel[uiPanel.itemslotsp2], 0) + ui.border, array_get(panel[uiPanel.itemslotsp2], 1) + ui.border, array_get(panel[uiPanel.itemslotsp2], 2) - ui.border, array_get(panel[uiPanel.itemslotsp2], 3) - ui.border, true);
		draw_line(array_get(panel[uiPanel.itemslotsp2], 0) + ui.border + ui.invSlotSize, array_get(panel[uiPanel.itemslotsp2], 1) + ui.border - 1, array_get(panel[uiPanel.itemslotsp2], 0) + ui.border + ui.invSlotSize, array_get(panel[uiPanel.itemslotsp2], 3) - ui.border);
		draw_line(array_get(panel[uiPanel.itemslotsp2], 0) + ui.border + (ui.invSlotSize*2), array_get(panel[uiPanel.itemslotsp2], 1) + ui.border - 1, array_get(panel[uiPanel.itemslotsp2], 0) + ui.border + (ui.invSlotSize*2), array_get(panel[uiPanel.itemslotsp2], 3) - ui.border);
		draw_sprite(sItem,array_get(ally[p2].item,0),array_get(panel[uiPanel.itemslotsp2],0) + ui.border,array_get(panel[uiPanel.itemslotsp2],1) + ui.border);
		draw_sprite(sItem,array_get(ally[p2].item,0),array_get(panel[uiPanel.itemslotsp2],0) + (ui.invSlotSize) + ui.border,array_get(panel[uiPanel.itemslotsp2],1) + ui.border);
		draw_sprite(sItem,array_get(ally[p2].item,0),array_get(panel[uiPanel.itemslotsp2],0) + (ui.invSlotSize*2) + ui.border,array_get(panel[uiPanel.itemslotsp2],1) + ui.border);
		
		//Actions - P2
		draw_set_valign(fa_top);
		draw_set_font(fn_text);
		//draw_rectangle_color(array_get(panel[uiPanel.actionsp2],0),array_get(panel[uiPanel.actionsp2],1),array_get(panel[uiPanel.actionsp2],2),array_get(panel[uiPanel.actionsp2],3),c_green,c_green,c_green,c_green,false);
		draw_text(array_get(panel[uiPanel.actionsp2],2) - ui.border, array_get(panel[uiPanel.actionsp2],1) + 0, "Attack");
		draw_text(array_get(panel[uiPanel.actionsp2],2) - ui.border, array_get(panel[uiPanel.actionsp2],1) + 15, "Items");
		draw_text(array_get(panel[uiPanel.actionsp2],2) - ui.border, array_get(panel[uiPanel.actionsp2],1) + 30, "Exit");
		
	}
	
	//Healthbar - P1
	//Add to array?
	var healthbarLength = array_get(panel[uiPanel.healthbarp1],2) - array_get(panel[uiPanel.healthbarp1],0);
	var healthbarPercent = healthbarLength * (ally[0].hp / ally[0].max_hp);
	//show_debug_message(array_get(panel[uiPanel.healthbarp1],0) + percent - ui.border*2)
	//draw_rectangle_color(array_get(panel[uiPanel.healthbar],0),array_get(panel[uiPanel.healthbar],1),array_get(panel[uiPanel.healthbar],2),array_get(panel[uiPanel.healthbar],3),c_ltgray,c_ltgray,c_ltgray,c_ltgray,false);
	draw_rectangle(array_get(panel[uiPanel.healthbarp1],0) + ui.border,array_get(panel[uiPanel.healthbarp1],1) + ui.border, array_get(panel[uiPanel.healthbarp1],2) - ui.border, array_get(panel[uiPanel.healthbarp1],3) - ui.border, false);
	draw_rectangle_color(array_get(panel[uiPanel.healthbarp1],0) + ui.border + 1,array_get(panel[uiPanel.healthbarp1],1) + ui.border + 1, array_get(panel[uiPanel.healthbarp1],0) + healthbarPercent - ui.border - 1, array_get(panel[uiPanel.healthbarp1],3) - ui.border - 1, c_red, c_red, c_red, c_red, false);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_set_font(fn_bar);
	draw_text(array_get(panel[uiPanel.healthbarp1],0) + ui.border, array_get(panel[uiPanel.healthbarp1],1), string(ally[p1].hp) + "/" + string(ally[p1].hp) + " HP");
	
	//Timeline - Scales to Player Count
	//Add to array?
	var timelineMiddle = ui.top + ( (array_get(panel[uiPanel.timeline],3) - array_get(panel[uiPanel.timeline], 1))/2 );
	var timelineLength = (array_get(panel[uiPanel.timeline],2) - ui.border*2 - 4) - (array_get(panel[uiPanel.timeline],0) + ui.border*2);
	//draw_rectangle_color(array_get(panel[uiPanel.timeline],0),array_get(panel[uiPanel.timeline],1),array_get(panel[uiPanel.timeline],2),array_get(panel[uiPanel.timeline],3),c_blue,c_blue,c_blue,c_blue,false);
	draw_line(array_get(panel[uiPanel.timeline],0) + ui.border, timelineMiddle, array_get(panel[uiPanel.timeline],2) - ui.border - 5, timelineMiddle);
	draw_line(array_get(panel[uiPanel.timeline],0) + ui.border, timelineMiddle - 7, array_get(panel[uiPanel.timeline],0) + ui.border, timelineMiddle + 7);
	
	//For each ally.
	for (var i = 0; i < array_length(ally); i++) {
		//this is so that the ui is not interrupted when instances are deleted
		if (controller.ally[i] != undefined) {
			draw_sprite(sMini,0,array_get(panel[uiPanel.timeline],0) + (timelineLength*ally[i].time) + ui.border,timelineMiddle);
		}
	}
	
	//For each enemy.
	for (var i = 0; i < array_length(enemy); i++) {
		//this is so that the ui is not interrupted when instances are deleted
		if (controller.enemy[i] != undefined) {
			draw_sprite(sMiniGrunt,0,array_get(panel[uiPanel.timeline],0) + (timelineLength*enemy[i].time) + ui.border,timelineMiddle + 1);
		}
	}
	
	//Inventory Slots - P1
	//draw_rectangle_color(array_get(panel[uiPanel.itemslots],0),array_get(panel[uiPanel.itemslots],1),array_get(panel[uiPanel.itemslots],2),array_get(panel[uiPanel.itemslots],3),c_red,c_red,c_red,c_red,false);
	draw_rectangle(array_get(panel[uiPanel.itemslotsp1], 0) + ui.border, array_get(panel[uiPanel.itemslotsp1], 1) + ui.border, array_get(panel[uiPanel.itemslotsp1], 2) - ui.border, array_get(panel[uiPanel.itemslotsp1], 3) - ui.border, true);
	draw_line(array_get(panel[uiPanel.itemslotsp1], 0) + ui.border + ui.invSlotSize, array_get(panel[uiPanel.itemslotsp1], 1) + ui.border - 1, array_get(panel[uiPanel.itemslotsp1], 0) + ui.border + ui.invSlotSize, array_get(panel[uiPanel.itemslotsp1], 3) - ui.border);
	draw_line(array_get(panel[uiPanel.itemslotsp1], 0) + ui.border + (ui.invSlotSize*2), array_get(panel[uiPanel.itemslotsp1], 1) + ui.border - 1, array_get(panel[uiPanel.itemslotsp1], 0) + ui.border + (ui.invSlotSize*2), array_get(panel[uiPanel.itemslotsp1], 3) - ui.border);
	draw_sprite(sItem,array_get(ally[p1].item,0),array_get(panel[uiPanel.itemslotsp1],0) + ui.border,array_get(panel[uiPanel.itemslotsp1],1) + ui.border);
	draw_sprite(sItem,array_get(ally[p1].item,0),array_get(panel[uiPanel.itemslotsp1],0) + (ui.invSlotSize) + ui.border,array_get(panel[uiPanel.itemslotsp1],1) + ui.border);
	draw_sprite(sItem,array_get(ally[p1].item,0),array_get(panel[uiPanel.itemslotsp1],0) + (ui.invSlotSize*2) + ui.border,array_get(panel[uiPanel.itemslotsp1],1) + ui.border);
	
	//Actions - P1
	//draw_rectangle_color(array_get(panel[uiPanel.actions],0),array_get(panel[uiPanel.actions],1),array_get(panel[uiPanel.actions],2),array_get(panel[uiPanel.actions],3),c_green,c_green,c_green,c_green,false);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	draw_set_font(fn_text);
	var text;
	text[0] = "Attack"
	text[1] = "Items"
	text[2] = "Exit"
	if (p1_menu) {
		text[menu_option] = " > " + string(text[menu_option]);
	}
	draw_text(array_get(panel[uiPanel.actionsp1],0) + ui.border, array_get(panel[uiPanel.actionsp1],1) + 0, text[0]);
	draw_text(array_get(panel[uiPanel.actionsp1],0) + ui.border, array_get(panel[uiPanel.actionsp1],1) + 15, text[1]);
	draw_text(array_get(panel[uiPanel.actionsp1],0) + ui.border, array_get(panel[uiPanel.actionsp1],1) + 30, text[2]);
	
	//Score - Centered
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_font(fn_score);
	draw_text(ui.right/2,ui.top + 50, "Score : " + string(score));
	
	
	side();
}

function side() {
	draw_rectangle_color(uiSide.left ,uiSide.top, uiSide.right, uiSide.bottom, c_gray, c_gray, c_gray, c_gray, false);
	if (array_length(ally) > 2) {
		if (global.has2players) {
			for (var i = 2; i < array_length(ally); i++) {
				var healthbarLength = (uiSide.right - uiSide.border) - (uiSide.left + uiSide.border);
				var healthbarPercent = healthbarLength * (ally[i].hp / ally[i].max_hp);
				draw_sprite(sMini,0,uiSide.left + 15,uiSide.top + 22 + ((i-2)*30));
				draw_rectangle(uiSide.left + uiSide.border,uiSide.top + 25 + ((i-2)*30), uiSide.right - uiSide.border, uiSide.top + 20 + ((i-2)*30), false);
				draw_rectangle_color(uiSide.left + uiSide.border,uiSide.top + 25 + ((i-2)*30), uiSide.left + uiSide.border + healthbarPercent, uiSide.top + 20 + ((i-2)*30), c_lime, c_lime, c_lime, c_lime, false);
			}
		} else {
			for (var i = 1; i < array_length(ally); i++) {
				var healthbarLength = (uiSide.right - uiSide.border) - (uiSide.left + uiSide.border);
				var healthbarPercent = healthbarLength * (ally[i].hp / ally[i].max_hp);
				draw_sprite(sMini,0,uiSide.left + 15,uiSide.top + 15 + ((i-1)*25));
				draw_rectangle(uiSide.left + uiSide.border,uiSide.top + 18 + ((i-1)*25), uiSide.right - uiSide.border, uiSide.top + 20 + ((i-1)*25), false);
				draw_rectangle_color(uiSide.left + uiSide.border,uiSide.top + 18 + ((i-1)*25), uiSide.left + uiSide.border + healthbarPercent, uiSide.top + 20 + ((i-1)*25), c_lime, c_lime, c_lime, c_lime, false);
			}
		}
	}
}