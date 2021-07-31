/// @description Game Start

enum gameState {
	battle,
	path
}

global.game = gameState.battle;
global.has2players = false;
global.timeMoving = true;

enum ui {
	left = 0,
	top = 600,
	right = 600,
	bottom = 700,
	border = 5,
	invSlotSize = 20
}

enum uiPanel {
	healthbarp1, healthbarp2, itemslotsp1, itemslotsp2, timeline, actionsp1, actionsp2
}

//							  [	Left,									Top,									Right,								Bottom									];
panel[uiPanel.healthbarp1]	= [	ui.left,								ui.top + 80,							ui.right,							ui.bottom								];
panel[uiPanel.healthbarp2]	= [	ui.right/2,								ui.top + 80,							ui.right,							ui.bottom								];
panel[uiPanel.itemslotsp1]	= [	ui.left,								ui.top,									ui.left + (ui.invSlotSize*3) + 10,	ui.top + ui.invSlotSize + 10			];
panel[uiPanel.itemslotsp2]	= [	ui.right - (ui.invSlotSize*3) - 10,		ui.top,									ui.right,							ui.top + ui.invSlotSize + 10			];
panel[uiPanel.timeline]		= [	array_get(panel[uiPanel.itemslotsp1],2),ui.top,									ui.right,							ui.bottom - 70							];
panel[uiPanel.actionsp1]	= [	ui.left,								array_get(panel[uiPanel.itemslotsp1],3),ui.left + 100,						array_get(panel[uiPanel.healthbarp1],1)	];
panel[uiPanel.actionsp2]	= [	ui.right - 100,							array_get(panel[uiPanel.itemslotsp1],3),ui.right,							array_get(panel[uiPanel.healthbarp1],1)	];

//Default arrays
ally = undefined;
enemy = undefined;

ally[0] = instance_create_layer(2*tile_width,2*tile_height,"Allies",oPlayer);

ally[0].time = 1;

enemy[0] = instance_create_layer(10*tile_width,8*tile_height,"Enemies",oPlayer);

enemy[0].time = 0.7;