/// @description Insert description here
// You can write your code in this editor

draw_sprite_ext(spr_guessbox, 0, x, y, image_xscale, image_yscale, rotation, c_white, 1-power(reveal_draw, 3));
draw_sprite_ext(spr_guessbox, display_style, x, y, image_xscale, image_yscale, rotation, c_white, power(reveal_draw, 3));


draw_sprite_ext(spr_guess_letters, letter, x, y, image_xscale, image_yscale, rotation, c_white, 1);