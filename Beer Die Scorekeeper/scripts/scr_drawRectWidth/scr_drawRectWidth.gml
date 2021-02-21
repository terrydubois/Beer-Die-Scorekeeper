function scr_drawRectWidth(argument0, argument1, argument2, argument3, argument4) {
	var rectX1 = argument0;
	var rectY1 = argument1;
	var rectX2 = argument2;
	var rectY2 = argument3;
	var width = argument4;

	draw_line_width(rectX1, rectY1, rectX1, rectY2, width);
	draw_line_width(rectX2, rectY1, rectX2, rectY2, width);
	draw_line_width(rectX1, rectY1, rectX2, rectY1, width);
	draw_line_width(rectX1, rectY2, rectX2, rectY2, width);


}
