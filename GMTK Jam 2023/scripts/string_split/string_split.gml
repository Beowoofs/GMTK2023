function string_split(_string, _delimiter, _max_array=-1) {
	var _a = _string;
	var splitBy = _delimiter; //string to split the first string by
	var slot = 0;
	var _splits; //array to hold all splits
	var str2 = ""; //var to hold the current split we're working on building

	var i;
	for (i = 1; i < (string_length(_a)+1); i++) {
	    var currStr = string_copy(_a, i, 1);
	    if (currStr == splitBy) {
	        _splits[slot] = str2; //add this split to the array of all splits
	        slot++;
	        str2 = "";
			if (_max_array == slot) { return _splits; }
	    } 
		else {
	        str2 = str2 + currStr;
	        _splits[slot] = str2;
	    }
	}
	return _splits;
}