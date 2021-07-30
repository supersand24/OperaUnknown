// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function userInterface(){
	draw_set_color(c_black);
	draw_rectangle(0 ,room_height - 100, room_width, room_height, false);
	
	if (global.has2players) {
		//2 Player UI Elements
	} else {
		//1 Player UI Elements
		
		
		/*
		var uiTop = (room_height - 100);
		var uiBottom = room_height;
		var uiLeft = 0;
		var uiRight = room_width;
		*/
		
		//#macro rmh room_height;
		//#macro rmw room_width;
		
		//var rm_height = room_height, rm_width = room_width;
		
		enum ui {
			left = 0,
			top = 600,
			right = 600,
			bottom = 700,
			border = 5
		}
		
		var invSlotSize = 20;
		
		enum uiPanel {
			healthbar, itemslots, timeline, actions
		}
		
		//							  [	Left,							Top,							Right,							Bottom							];
		panel[uiPanel.healthbar]	= [	ui.left,						ui.top + 80,					ui.right,						ui.bottom						];
		panel[uiPanel.itemslots]	= [	ui.left,						ui.top,							ui.left + (invSlotSize*3) + 10,	ui.top + invSlotSize + 10		];
		panel[uiPanel.timeline]		= [	array_get(panel[uiPanel.itemslots],2),	ui.top,							ui.right,						ui.bottom - 70					];
		panel[uiPanel.actions]		= [	ui.left,						array_get(panel[uiPanel.itemslots],3),	ui.left + 100,					array_get(panel[uiPanel.healthbar],1)	];
		
		draw_set_color(c_white);

	}
	
	//Healthbar
	//draw_rectangle_color(array_get(panel[uiPanel.healthbar],0),array_get(panel[uiPanel.healthbar],1),array_get(panel[uiPanel.healthbar],2),array_get(panel[uiPanel.healthbar],3),c_ltgray,c_ltgray,c_ltgray,c_ltgray,false);
	
	draw_rectangle(array_get(panel[uiPanel.healthbar],0) + ui.border,array_get(panel[uiPanel.healthbar],1) + ui.border, array_get(panel[uiPanel.healthbar],2) - ui.border, array_get(panel[uiPanel.healthbar],3) - ui.border, false);
	
	//Timeline
	var middle = ui.top + ( (array_get(panel[uiPanel.timeline],3) - array_get(panel[uiPanel.timeline], 1))/2 );
	//draw_rectangle_color(array_get(panel[uiPanel.timeline],0),array_get(panel[uiPanel.timeline],1),array_get(panel[uiPanel.timeline],2),array_get(panel[uiPanel.timeline],3),c_blue,c_blue,c_blue,c_blue,false);
	
	draw_line(array_get(panel[uiPanel.timeline],0) + ui.border, middle, array_get(panel[uiPanel.timeline],2) - ui.border - 5, middle);
	draw_line(array_get(panel[uiPanel.timeline],0) + ui.border, middle - 7, array_get(panel[uiPanel.timeline],0) + ui.border, middle + 7);
	
	//Inventory Slots
	//draw_rectangle_color(array_get(panel[uiPanel.itemslots],0),array_get(panel[uiPanel.itemslots],1),array_get(panel[uiPanel.itemslots],2),array_get(panel[uiPanel.itemslots],3),c_red,c_red,c_red,c_red,false);
	
	draw_rectangle(array_get(panel[uiPanel.itemslots], 0) + ui.border, array_get(panel[uiPanel.itemslots], 1) + ui.border, array_get(panel[uiPanel.itemslots], 2) - ui.border, array_get(panel[uiPanel.itemslots], 3) - ui.border, true);
	draw_line(array_get(panel[uiPanel.itemslots], 0) + ui.border + invSlotSize, array_get(panel[uiPanel.itemslots], 1) + ui.border - 1, array_get(panel[uiPanel.itemslots], 0) + ui.border + invSlotSize, array_get(panel[uiPanel.itemslots], 3) - ui.border);
	draw_line(array_get(panel[uiPanel.itemslots], 0) + ui.border + (invSlotSize*2), array_get(panel[uiPanel.itemslots], 1) + ui.border - 1, array_get(panel[uiPanel.itemslots], 0) + ui.border + (invSlotSize*2), array_get(panel[uiPanel.itemslots], 3) - ui.border);
		
	//Score
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_font(fn_score);
	draw_text(room_width/2,ui.top + 50, "Score : " + string(score));
	
	//Actions
	//draw_rectangle_color(array_get(panel[uiPanel.actions],0),array_get(panel[uiPanel.actions],1),array_get(panel[uiPanel.actions],2),array_get(panel[uiPanel.actions],3),c_green,c_green,c_green,c_green,false);
		
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(fn_text);
	draw_text(array_get(panel[uiPanel.actions],0) + ui.border, array_get(panel[uiPanel.actions],1) + 2, "Attack");
	draw_text(array_get(panel[uiPanel.actions],0) + ui.border, array_get(panel[uiPanel.actions],1) + 18, "Items");
	draw_text(array_get(panel[uiPanel.actions],0) + ui.border, array_get(panel[uiPanel.actions],1) + 34, "Exit");
	
}