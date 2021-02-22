// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_newGameButton(){
	
	var newGameX1 = bufferHorizonal;
	var newGameX2 = newGameX1 + string_width(" New Game ");
	var newGameY1 = bufferHorizonal;
	var newGameY2 = newGameY1 + string_height("A");
	draw_set_color(c_white);
	scr_drawRectWidth(newGameX1, newGameY1, newGameX2, newGameY2, 3);
	if (point_in_rectangle(mouse_x, mouse_y, newGameX1, newGameY1, newGameX2, newGameY2)) {
		draw_set_color(colorDarkGray);
		draw_rectangle(newGameX1, newGameY1, newGameX2, newGameY2, false);
		if (mouse_check_button_pressed(mb_left)) {
			if (show_question("Start new game?")) {
				scr_saveGrid();
				scr_resetGrid();
			}
		}
	}
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(fnt_colName);
	draw_text(floor(mean(newGameX1, newGameX2)), floor(mean(newGameY1, newGameY2)), " New Game ");

}