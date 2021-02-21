team1Score = 0;
team2Score = 0;

gameGridWidth = 7;
gameGridHeight = 4;
gameGrid_colName = 0;
gameGrid_colPoints = 1;
gameGrid_colCatches = 2;
gameGrid = ds_grid_create(gameGridWidth, gameGridHeight);


colNameList = ds_list_create();
ds_list_add(colNameList, "Name", "Points", "Catches", "Clinks", "Plants", "Shotguns", "Sinks");



colorVVDarkGray = make_color_rgb(40, 40, 40);
colorVDarkGray = make_color_rgb(50, 50, 50);
colorDarkGray = make_color_rgb(75, 75, 75);

mouseoverRow = -1;

scr_resetGrid();