
scr_newGameButton();

// grid coordinates
gameGridX1 = bufferHorizonal;
gameGridY1 = 350;
gameGridX2 = room_width - bufferHorizonal;
gameGridY2 = room_height * 0.87;
gameGridRectWidth = gameGridX2 - gameGridX1;
gameGridRectHeight = gameGridY2 - gameGridY1;

colWidth = gameGridRectWidth / (ds_grid_width(gameGrid) + 1);
colHeight = gameGridRectHeight / ds_grid_height(gameGrid);

scr_drawTeamRects();

if (!point_in_rectangle(mouse_x, mouse_y, gameGridX1, gameGridY1, gameGridX2, gameGridY2)) {
	mouseoverRow = -1;
}

for (var i = 0; i < ds_grid_width(gameGrid); i++) {
	for (var j = 0; j < ds_grid_height(gameGrid); j++) {
		
		// get data for this cell
		var currentCellVal = ds_grid_get(gameGrid, i, j);
		var currentCellStr = string(currentCellVal);
		
		// get coordinates for this cell
		var rectX1 = gameGridX1 + (colWidth * (i + 1));
		var rectY1 = gameGridY1 + (colHeight * j);
		var rectX2 = rectX1 + colWidth;
		var rectY2 = rectY1 + colHeight;
		var rectWidth = rectX2 - rectX1;
		var rectHeight = rectY2 - rectY1;
		var mouseoverCell = point_in_rectangle(mouse_x, mouse_y, rectX1, rectY1, rectX2, rectY2);
		var mouseoverCellInc = false;
		var mouseoverCellDec = false;
		
		
		if (mouseoverCell) {
			mouseoverRow = j;
			draw_set_color(colorDarkGray);
			draw_rectangle(rectX1, rectY1, rectX2, rectY2, false);
			
			if (mouse_x > rectX1 + (colWidth / 2)) {
				mouseoverCellInc = true;
			}
			else {
				mouseoverCellDec = true;
			}
			
			// draw tip
			if (i != gameGrid_colName) {
				var rowName = string(ds_grid_get(gameGrid, gameGrid_colName, j));
				var colName = string(ds_list_find_value(colNameList, i));
				draw_set_color(c_white);
				draw_set_font(fnt_tip);
				draw_text(floor(mean(rectX1, rectX2)), floor(rectY1 + (rectHeight * 0.8)), rowName + " - " + colName);
			}
			
			// click to increase/decrease value or change player name
			if (mouse_check_button_pressed(mb_left)) {	
				if (i == gameGrid_colName) {
					currentCellVal = get_string("Enter this player's name", "");
					ds_grid_set(gameGrid, i, j, currentCellVal);
				}
				else {
					currentCellVal += (mouseoverCellInc) ? 1 : -1;
					currentCellVal = max(currentCellVal, 0);
					ds_grid_set(gameGrid, i, j, currentCellVal);
				}
			}
		}
		else {
			
			draw_set_color((mouseoverRow == j) ? colorVDarkGray : colorVVDarkGray);
			draw_rectangle(rectX1, rectY1, rectX2, rectY2, false);
		}
		
		// draw text for this cell
		var textX = floor(mean(rectX1, rectX2));
		var textY = floor(rectY1 + (rectHeight * 0.45));
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_font((i == gameGrid_colName) ? fnt_playerName : fnt_gridCell);
		draw_set_color(c_white);
		draw_text(textX, textY, currentCellStr);
		
		// draw troll text if this player is trolling
		if (i == gameGrid_colName) {
			var points = ds_grid_get(gameGrid, gameGrid_colPoints, j);
			if (points < 1) {
				var trollTextX = textX;
				var trollTextY = floor(rectY1 + (rectHeight * 0.85));
				draw_set_font(fnt_tip);
				draw_set_color(c_red);
				draw_text(trollTextX, trollTextY, "TROLL");
			}
		}
		
		// draw inc/dec arrows if mouse is hovered on this cell
		if (i != gameGrid_colName && mouseoverCell) {
			var incSprX = floor(rectX1 + (colWidth * 0.8));
			var incSprY = textY;
			var decSprX = floor(rectX1 + (colWidth * 0.2));
			var decSprY = incSprY;
			var incDecScale = 0.7;
			draw_sprite_ext(spr_inc, 0, incSprX, incSprY, incDecScale, incDecScale, 0, c_white, 0.8);
			draw_sprite_ext(spr_dec, 0, decSprX, decSprY, incDecScale, incDecScale, 0, c_white, 0.8);
		}
		
		
		// draw cell outline
		draw_set_color(c_white);
		scr_drawRectWidth(rectX1, rectY1, rectX2, rectY2, 3);
		
	}
	
	
	var colNameStr = ds_list_find_value(colNameList, i);
	var colNameX = mean(rectX1, rectX2);
	var colNameY = gameGridY1 - 50;
	draw_set_font(fnt_colName);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_alpha(1);
	draw_text(colNameX, colNameY, colNameStr);
}



team1Score = ds_grid_get(gameGrid, gameGrid_colPoints, 0) + ds_grid_get(gameGrid, gameGrid_colPoints, 1);
team2Score = ds_grid_get(gameGrid, gameGrid_colPoints, 2) + ds_grid_get(gameGrid, gameGrid_colPoints, 3);



draw_set_color(c_white);
draw_line_width(gameGridX1 + colWidth, gameGridY1, gameGridX1 + colWidth, gameGridY2, 6);