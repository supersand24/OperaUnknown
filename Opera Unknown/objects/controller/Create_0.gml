/// @description Game Start

enum gameState {
	battle,
	path
}

global.game = gameState.battle;
global.has2players = false;