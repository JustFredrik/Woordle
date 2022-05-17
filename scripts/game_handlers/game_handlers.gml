// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function end_game(){
	game_end();
}

function spawn_guessboard(){
	instance_create_layer(o_root.x, 1200, "Instances", o_guessboard);	
}

function spawn_keyboard(){
	instance_create_layer(o_root.x, 1600, "Instances", o_keyboard);	
}

function initialize_base_game(){
	random_set_seed((current_day + current_month +current_year + current_hour + current_minute * 3600 + current_second * 60)%2999 );
	o_root.correct_word = o_root.english_words[(current_day + current_month +current_year + current_hour + current_minute * 3600 + current_second * 60)%2999];
	show_debug_message("CORRECT WORD: " + o_root.correct_word);
	spawn_guessboard();	
	spawn_keyboard();
}

function game_win(){
		
}

function game_lose(){
		
}

function get_english_keyboard_layout(){
	var row_0_ = ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"];
	var row_1_ = ["A", "S", "D", "F", "G", "H", "J", "K", "L"];
	var row_2_ = ["Z", "X", "C", "V", "B", "N", "M"];	
	
	var rows_ = [row_0_, row_1_, row_2_];
	return rows_
}

function submit(){
	o_root.correct_in_a_row = 0;
	if (is_in_array(current_guess, o_root.all_english_words)){
		submission_approved();	
	} else {
		submission_denied();	
	}
}

function check_display_style(index, word, correct_word){
	show_debug_message(index);
	show_debug_message(word);
	show_debug_message(correct_word);
	
	/*
	This function does all the correct checks for a letter to get it's correct color.	
	*/
	var i_;
	var letter_count = 0;
	var letter_in_right_spot = 0;
	var valid_letters, is_yellow;
	var display_style = 1;
	
	// Check if it's Green.
	if (string_char_at(word, index+1) == string_char_at(correct_word, index+1)){
		display_style = 3;
	}
	
	// Check if Yellow
	//Count instances of letter in correct word
	if (display_style != 3){
		
		for (i_ = 0; i_ < string_length(correct_word); i_++){
			letter_count += (string_char_at(word, index+1) == string_char_at(correct_word, i_+1));
		}
	
		//Count of many instances of leter that is in the right spot
		for (i_ = 0; i_ < string_length(correct_word); i_++){
			letter_in_right_spot += (string_char_at(word, index+1) == string_char_at(word, i_+1) && string_char_at(word, i_+1) == string_char_at(correct_word, i_+1));
		}
	
		valid_letters = letter_count - letter_in_right_spot;
	
		for (i_ = 0; i_ < string_length(correct_word); i_++){
			if (valid_letters <= 0){ break; }
			is_yellow =  (string_char_at(word, index+1) == string_char_at(word, i_+1) && string_char_at(word, i_+1) != string_char_at(correct_word, i_+1));
			if (is_yellow && i_ == index){
				display_style = display_style > 2 ? display_style : 2;
			}
			valid_letters -= is_yellow;	
		}
	
	}
	
	show_debug_message(display_style);
	show_debug_message("-----------------");
	
	// Return It as Grey
	return display_style;
	
}

