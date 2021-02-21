function scr_resetGrid() {
	ds_grid_clear(gameGrid, 0);

	ds_grid_set(gameGrid, gameGrid_colName, 0, "Player 1");
	ds_grid_set(gameGrid, gameGrid_colName, 1, "Player 2");
	ds_grid_set(gameGrid, gameGrid_colName, 2, "Player 3");
	ds_grid_set(gameGrid, gameGrid_colName, 3, "Player 4");


}
