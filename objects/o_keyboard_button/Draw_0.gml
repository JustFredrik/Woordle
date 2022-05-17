/// @description Insert description here
// You can write your code in this editor

var button_sprite_ = (action == virtual_keyboard_letter) ? spr_keyboard_button : spr_keyboard_wide;

draw_sprite_ext(button_sprite_, 0, x, y, image_xscale, image_yscale, 0, c_white, 1-power(clamp((reveal_draw-0.3)*1.42, 0, 1), 3));
draw_sprite_ext(button_sprite_, display_style, x, y, image_xscale, image_yscale, 0, c_white, power(clamp((reveal_draw-0.3)*1.42, 0, 1), 3));


switch(action){
	case virtual_keyboard_letter:
		var text_alpha_ = (display_style == 1) ? 1-power(clamp((reveal_draw-0.3)*1.35, 0, 1), 3) : 1;
		draw_sprite_ext(spr_keyboard_letters, place_in_alphabet(key), x, y, image_xscale, image_yscale, 0, c_white, text_alpha_);
		draw_sprite_ext(button_sprite_, 4, x, y, image_xscale, image_yscale, 0, c_white, (image_xscale-1)*2 + (click_progress/4));
		break;
	
	case virtual_keyboard_backspace:
		draw_sprite_ext(spr_keyboard_icons, 1, x, y, image_xscale, image_yscale, 0, c_white, 1);
		draw_sprite_ext(button_sprite_, 1, x, y, image_xscale, image_yscale, 0, c_white, (image_xscale-1)*2 + (click_progress/4));
		break;
		
	default:
		draw_sprite_ext(spr_keyboard_icons, 0, x, y, image_xscale, image_yscale, 0, c_white, 1);
		draw_sprite_ext(button_sprite_, 1, x, y, image_xscale, image_yscale, 0, c_white, (image_xscale-1)*2 + (click_progress/4));
		break;
}