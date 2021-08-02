/// @description Destroy Self
bullets--;
if (bullets <= 0) {
	instance_destroy();
	with (controller.ally[user]) useTurn();
} else {
	x = startX;
	y = startY;
}