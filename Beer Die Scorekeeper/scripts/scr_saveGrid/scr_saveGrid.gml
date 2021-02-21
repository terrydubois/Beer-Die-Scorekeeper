function scr_saveGrid() {
	var csvList = ds_list_create();


	var csvHeaderLine = "";
	for (var i = 0; i < ds_list_size(colNameList); i++) {
		csvHeaderLine += string(ds_list_find_value(colNameList, i)) + ",";
	}

	for (var j = 0; j < ds_grid_height(gameGrid); j++) {	
		var csvLine = "";
		for (var i = 0; i < ds_grid_width(gameGrid); i++) {
			csvLine += string(ds_grid_get(gameGrid, i, j)) + ",";
		}
		ds_list_add(csvList, csvLine);
	}



	var filepath = get_save_filename("Beer Die Game|*.csv", "");
	if (filepath != "") {
	
		var file = file_text_open_write(filepath);
	
		file_text_write_string(file, csvHeaderLine);
		file_text_writeln(file);
		for (var i = 0; i < ds_list_size(csvList); i++) {
			var currentCSVLine = string(ds_list_find_value(csvList, i));
			file_text_write_string(file, currentCSVLine);
			file_text_writeln(file);
		}
		file_text_close(file);
	}


}
