/// @description Insert description here
// You can write your code in this editor
event_inherited();

if (array_length(guesses) > 0) { // Conditions to Freeze Guess Board
	if guesses[array_length(guesses)-1] == o_root.correct_word{ exit; }
	if array_length(guesses) >= o_root.max_guess { exit; }
}

if(keyboard_check_pressed(vk_anykey)){

	if(string_upper(keyboard_lastchar) == string_upper(chr(keyboard_lastkey)) && is_in_array(string_upper(keyboard_lastchar), approved_keys) ){
		add_character(keyboard_lastchar);
	}
}

if keyboard_check_pressed(vk_backspace){
	remove_character();
}

if keyboard_check_pressed(vk_enter){
	submit();	
}
if (array_length(guesses) < o_root.max_guess){
	guess_rows[array_length(guesses)].word = current_guess;
}