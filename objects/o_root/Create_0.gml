/// @description Initialize Variables & Methods
// You can write your code in this editor

crashr_upload_reports();

x = room_width / 2;
y = room_height / 2;


// Initialize Variables
english_words = get_english_words();
all_english_words = get_all_english_words();
correct_word = "";
max_guess = 6;
word_length = 5;
correct_in_a_row = 0;

// Declare Methods
function create_gameboard(){
	logo			= instance_create_layer(x, y+2000,"Instances", o_logo);
	streak			= instance_create_layer(x, y+2000,"Instances", o_streak);
	logo.anchor		= self;
	streak.anchor	= self;
}


// Initialize Game
create_gameboard();
initialize_base_game();