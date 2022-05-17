/// @description Insert description here
// You can write your code in this editor

event_inherited();


for (var i_ = 0; i_ < o_root.word_length; i_++){
	letters[i_].letter = place_in_alphabet(string_char_at(word, i_+1));
}


// Set Letter Colors and Trigger Reveal Animation
if ((previous_word != word) && submitted == true){
	if (word == o_root.correct_word){
		alarm_set(0, reveal_time_offset * o_root.word_length);	
	}
	
	if ((array_length(o_guessboard.guesses) >= o_root.max_guess) && (word != o_root.correct_word)){
		alarm_set(1, reveal_time_offset * (o_root.word_length +0.6));	
	}
	
	submitted = false;
	previous_word = word;
	for (i_ = 0; i_ < o_root.word_length; i_++){
		current_i = i_;
	
	with(letters[i_]){
		alarm_set(0, other.current_i * other.reveal_time_offset + 1);
	}
	
	var display_style_ = check_display_style(i_, word, o_root.correct_word);
	letters[i_].display_style = display_style_;
}
}