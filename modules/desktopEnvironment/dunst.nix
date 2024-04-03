{ pkgs, ... }:
{
  services.dunst = {
    enable = true;
    package = pkgs.dunst;
    iconTheme = {
      name = "kora";
      package = pkgs.kora-icon-theme;
      size = "32x32";
    };
    settings = {
      global = {
	monitor = 0;
	follow = "keyboard";
	width = "(0,300)";
	height = 300;
	origin = "top-right";
	offset = "10x50";
	scale = 0;
    	progress_bar = true;
   	progress_bar_height = 12;
	progress_bar_frame_width = 1;
    	progress_bar_min_width = 150;
	progress_bar_max_width = 300;
	progress_bar_corner_radius = 6;
	icon_corner_radius = 8;
        indicate_hidden = "yes";
	transparency = 0;
    	separator_height = 3;
    	padding = 8;
    	horizontal_padding = 8;
    	text_icon_padding = 5;
    	frame_width = 3;
    	frame_color = "#29293f";
    	gap_size = 5;
    	separator_color = "frame";
    	sort = "yes";
    	font = "FiraCode Nerd Font Mono 11";
	line_height = 0;
	markup = "full";
	format = "<b>%a</b>\n%s\n\n%b";
	alignment = "left";
	vertical_alignment = "center";
	show_age_threshold = 60
    	ellipsize = "middle";
    	ignore_newline = "no";
    	stack_duplicates = "true";
    	hide_duplicate_count = "false";
    	show_indicators = "yes";
	enable_recursive_icon_lookup = true;
    	icon_position = "left";
	sticky_history = "yes";
	history_length = 20;
	title = "Dunst";
	class = "Dunst";
	corner_radius = 8;
	ignore_dbusclose = false;
	mouse_left_click = "close_current";
	mouse_middle_click = "do_action, close_current";
	mouse_right_click = "close_all";
      };

      urgency_low = {
	background = "#12121f";
	foreground = "#d4d7ff";
	timeout = 10;
      };

      urgency_normal = {
	background = "#12121f";
	foreground = "#d4d7ff";
	timeout = 10;
      };

      urgency_critical = {
	background = "#12121f";
	foreground = "#d95177";
	frame_color = "#d95177";
	timeout = 0;
      };
    };
  };
}
