/// @description Game Start

randomise();

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
	right = 560,
	bottom = 700,
	border = 5,
	invSlotSize = 20
}

enum uiSide {
	left = ui.right,
	top = 600,
	right = 600,
	bottom = 700,
	border = 10
}

enum uiPanel {
	healthbarp1, healthbarp2, itemslotsp1, itemslotsp2, timeline, actionsp1, actionsp2
}

enum unitStates {
	idle, walking
}

enum weapon {
	pistol, smg, assault_rifle, lmg, dmr
}


//								[range, dmg, burst]
guns[weapon.pistol]				= [3, 5, 1];
guns[weapon.smg]				= [3, 5, 3];
guns[weapon.assault_rifle]		= [6, 12, 2];
guns[weapon.lmg]				= [6, 12, 3];
guns[weapon.dmr]				= [8, 30, 1];

//							  [	Left,									Top,									Right,								Bottom									];
panel[uiPanel.healthbarp1]	= [	ui.left,								ui.top + 80,							ui.right,							ui.bottom								];
panel[uiPanel.healthbarp2]	= [	ui.right/2,								ui.top + 80,							ui.right,							ui.bottom								];
panel[uiPanel.itemslotsp1]	= [	ui.left,								ui.top,									ui.left + (ui.invSlotSize*3) + 10,	ui.top + ui.invSlotSize + 10			];
panel[uiPanel.itemslotsp2]	= [	ui.right - (ui.invSlotSize*3) - 10,		ui.top,									ui.right,							ui.top + ui.invSlotSize + 10			];
panel[uiPanel.timeline]		= [	array_get(panel[uiPanel.itemslotsp1],2),ui.top,									ui.right,							ui.bottom - 70							];
panel[uiPanel.actionsp1]	= [	ui.left,								array_get(panel[uiPanel.itemslotsp1],3),ui.left + 100,						array_get(panel[uiPanel.healthbarp1],1)	];
panel[uiPanel.actionsp2]	= [	ui.right - 100,							array_get(panel[uiPanel.itemslotsp1],3),ui.right,							array_get(panel[uiPanel.healthbarp1],1)	];

enum itemIndex {
	nothing
}

//types of enemies
enemyTypes = [oRobot, oPuppy, oGrunt, oSoldier, oBeast, oSniper, oBerserker, oCommander];

enum playerInput {
	left, up, right, down, enter, length
}

//Default arrays
ally = undefined;
enemy = undefined;

ally[0] = instance_create_layer(0*tile_size,1*tile_size,"Allies",oPlayer);
//ally[1] = instance_create_layer(3*tile_size,2*tile_size,"Allies",oPlayer);
//ally[2] = instance_create_layer(4*tile_size,2*tile_size,"Allies",oPlayer);
//ally[3] = instance_create_layer(5*tile_size,2*tile_size,"Allies",oPlayer);
//ally[4] = instance_create_layer(5*tile_size,2*tile_size,"Allies",oPlayer);

//Link players to controller
p1 = 0;
p2 = 0;

enum menuState {
	movement, menu, attacking, getTargets
}

p1_menu = menuState.movement;
p2_menu = menuState.movement;

menu_option = 0;
menu_target = 0;

setRoom();

global.ctIndexes = false

global.ctBlob[   0 ] = [ 3 , 3 ];

global.ctBlob[   1 ] = [ 3 , 2 ];
global.ctBlob[   4 ] = [ 0 , 3 ];
global.ctBlob[  16 ] = [ 3 , 0 ];
global.ctBlob[  64 ] = [ 2 , 3 ];

global.ctBlob[   5 ] = [ 4 , 3 ];
global.ctBlob[  20 ] = [ 4 , 0 ];
global.ctBlob[  80 ] = [ 7 , 0 ];
global.ctBlob[  65 ] = [ 7 , 3 ];

global.ctBlob[   7 ] = [ 0 , 2 ];
global.ctBlob[  28 ] = [ 0 , 0 ];
global.ctBlob[ 112 ] = [ 2 , 0 ];
global.ctBlob[ 193 ] = [ 2 , 2 ];

global.ctBlob[  17 ] = [ 3 , 1 ];
global.ctBlob[  68 ] = [ 1 , 3 ];

global.ctBlob[  21 ] = [ 4 , 4 ];
global.ctBlob[  69 ] = [ 8 , 3 ];
global.ctBlob[  81 ] = [ 7 , 4 ];
global.ctBlob[  84 ] = [ 8 , 0 ];

global.ctBlob[  23 ] = [ 4 , 1 ];
global.ctBlob[  92 ] = [ 6 , 0 ];
global.ctBlob[ 113 ] = [ 7 , 2 ];
global.ctBlob[ 197 ] = [ 5 , 3 ];

global.ctBlob[  29 ] = [ 4 , 2 ];
global.ctBlob[  71 ] = [ 6 , 3 ];
global.ctBlob[ 116 ] = [ 5 , 0 ];
global.ctBlob[ 209 ] = [ 7 , 1 ];

global.ctBlob[  31 ] = [ 0 , 1 ];
global.ctBlob[ 124 ] = [ 1 , 0 ];
global.ctBlob[ 241 ] = [ 2 , 1 ];
global.ctBlob[ 199 ] = [ 1 , 2 ];

global.ctBlob[  85 ] = [ 8 , 4 ];

global.ctBlob[  87 ] = [ 9 , 3 ];
global.ctBlob[  93 ] = [ 9 , 2 ];
global.ctBlob[ 117 ] = [ 10 , 2 ];
global.ctBlob[ 213 ] = [ 10 , 3 ];

global.ctBlob[  95 ] = [ 6 , 4 ];
global.ctBlob[ 125 ] = [ 8 , 2 ];
global.ctBlob[ 245 ] = [ 5 , 4 ];
global.ctBlob[ 215 ] = [ 8 , 1 ];

global.ctBlob[ 119 ] = [ 9 , 1 ];
global.ctBlob[ 221 ] = [ 9 , 0 ];

global.ctBlob[ 127 ] = [ 6 , 2 ];
global.ctBlob[ 253 ] = [ 5 , 2 ];
global.ctBlob[ 247 ] = [ 5 , 1 ];
global.ctBlob[ 223 ] = [ 6 , 1 ];

global.ctBlob[ 255 ] = [ 1 , 1 ];


//BigGrid

global.bigGrid[0,0] = -1;
global.bigGrid[1,0] = -1;
global.bigGrid[2,0] = -1;
global.bigGrid[3,0] = -1;

global.bigGrid[0,1] = -1;
global.bigGrid[1,1] = -1;
global.bigGrid[2,1] = -1;
global.bigGrid[3,1] = -1;

global.bigGrid[0,2] = -1;
global.bigGrid[1,2] = -1;
global.bigGrid[2,2] = -1;
global.bigGrid[3,2] = -1;

global.bigGrid[0,3] = -1;
global.bigGrid[1,3] = -1;
global.bigGrid[2,3] = -1;
global.bigGrid[3,3] = -1;
