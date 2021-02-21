if (live_call()) return live_result;

var team1RectX1 = gameGridX1;
var team1RectY1 = gameGridY1;
var team1RectX2 = team1RectX1 + colWidth;
var team1RectY2 = team1RectY1 + (colHeight * 2);
var team2RectX1 = gameGridX1;
var team2RectY1 = team1RectY2;
var team2RectX2 = team2RectX1 + colWidth;
var team2RectY2 = team2RectY1 + (colHeight * 2);

scr_drawRectWidth(team1RectX1, team1RectY1, team1RectX2, team1RectY2, 3);
scr_drawRectWidth(team2RectX1, team2RectY1, team2RectX2, team2RectY2, 3);


var team1NameX = floor(mean(team1RectX1, team1RectX2));
var team1NameY = floor(mean(team1RectY1, team1RectY1, team1RectY2));
var team1ScoreX = team1NameX;
var team1ScoreY = floor(mean(team1RectY1, team1RectY2, team1RectY2));

var team2NameX = floor(mean(team2RectX1, team2RectX2));
var team2NameY = floor(mean(team2RectY1, team2RectY1, team2RectY2));
var team2ScoreX = floor(mean(team2RectX1, team2RectX2));
var team2ScoreY = floor(mean(team2RectY1, team2RectY2, team2RectY2));

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_teamName);
draw_text(team1NameX, team1NameY, "Team 1");
draw_text(team2NameX, team2NameY, "Team 2");

draw_set_font(fnt_teamScore);
draw_text(team1ScoreX, team1ScoreY, string(team1Score));
draw_text(team2ScoreX, team2ScoreY, string(team2Score));


