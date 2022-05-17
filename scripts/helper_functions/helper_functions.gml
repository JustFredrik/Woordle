// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function is_in_array(value, array){
	var len_ = array_length(array);
	var return_value_ = false;

	for(var i_ = 0; i_ < len_; i_++){
		return_value_ = (return_value_ or (value == array[i_]));
	}
	return return_value_
}

function place_in_alphabet(letter){
	var alphabet_ = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];
	
	for (var i_ = 0; i_ < array_length(alphabet_) ; i_++){
		if (letter == alphabet_[i_]){
			return i_;	
		}
	}
	return 26;
}

function char_in_string(str, char){
	for (var i_ = 0; i_ <= string_length(str); i_++){
		if (string_upper(string_char_at(str, i_)) == string_upper(char)){
			return true;	
		}
	}
	return false;
}