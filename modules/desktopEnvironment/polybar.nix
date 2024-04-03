# vim:fileencoding=utf-8:foldmethod=marker

{ config, pkgs, ... }:

let 

# Colours {{{

  bg-1 = "#12121f";
  bg-2 = "#171728";
  bg-3 = "#1d1d2f";
  bg-4 = "#222236";
  bg-5 = "#29293f";

  fg-1 = "#d4d7ff";
  fg-2 = "#d0d3ff";
  fg-3 = "#cccfff";

  grey-1 = "#4f5071";
  grey-2 = "##595b7e";
  grey-3 = "#63658b";

  red-1 = "#de688a";
  red-2 = "#da587d";
  red-3 = "#d74770";

  purple-1 = "#9792dd";
  purple-2 = "#8983d8";
  purple-3 = "#7a73d3";

  blue-1 = "#83a8ec";
  blue-2 = "#729ce9";
  blue-3 = "#608fe6";

  cyan-1 = "#89e6e4";
  cyan-2 = "#78e2e1";
  cyan-3 = "#65dedc";

  green-1 = "#8fe0b4";
  green-2 = "#7fdca9";
  green-3 = "#6fd89e";

  yellow-1 = "#fdf5b0";
  yellow-2 = "#fcf39c";
  yellow-3 = "#fbf088";

  orange-1 = "#e7c188";
  orange-2 = "#e3b878";
  orange-3 = "#e0af67";

# }}}

in  
{
  services.polybar = {
    enable = true;
    package = pkgs.polybar;
    #package = pkgs.polybar.override { i3GapsSupport = true; };
    script = "polybar -q -r primary-top & polybar -q -r secondary-top &";
    config = {
      "global/wm" = {
	margin-top = 0;
	margin-bottom = 0;
      };

      "bar/primary-top" = {
	monitor = "${env:MONITOR:DP1}";
	monitor-exact = true;
	overide-redirect = false;
	enable-ipc = true;
	bottom = false;
	fixed-center = true;
	width = "100%";
	height = "23pt";
	offset-x = "98%";
	offset-y = "8pt";
	border-size = "5pt";
	border-color = "${bg-4}";
	line-size = "1pt";
	padding-left = "0pt";
	padding-right = "0pt";
	module-margin-left = "0pt";
	module-margin-right = "0pt";
	background = "${bg-4}";
	foreground = "${fg-1}";
	font-0 = "FiraCode Nerd Font Mono:size=13";
	font-1 = "FiraCode Nerd Font Mono:size=22";
	font-2 = "FiraCode Nerd Font Mono:size=25";
	font-3 = "FiraCode Nerd Font Mono:size=16";
	scroll-up = "i3.next";
	scroll-down = "i3.prev";
	modules-left = "left filesystem slash space slash cpu slash space slash memory slash space slash temperature slash space slash xworkspaces-0 right";
	modules-center = "left xwindows right";
	mpdules-right = "left pulseaudio slash space slash network slash space slash time slash space slash date right";
	wm-restock = "i3";
      };

      "bar/secondary-top" = {
	monitor = "${env:MONITOR:DP3}";
	monitor-exact = true;
	overide-redirect = true;
	enable-ipc = true;
	bottom = false;
	fixed-center = true;
	width = "100%";
	height = "23pt";
	offset-x = "98%";
	offset-y = "8pt";
	border-size = "5pt";
	border-color = "${bg-4}";
	line-size = "1pt";
	padding-left = "0pt";
	padding-right = "0pt";
	module-margin-left = "0pt";
	module-margin-right = "0pt";
	background = "${bg-4}";
	foreground = "${fg-1}";
	font-0 = "FiraCode Nerd Font Mono:size=13";
	font-1 = "FiraCode Nerd Font Mono:size=22";
	font-2 = "FiraCode Nerd Font Mono:size=25";
	font-3 = "FiraCode Nerd Font Mono:size=16";
	scroll-up = "i3.next";
	scroll-down = "i3.prev";
	modules-left = "";
	modules-center = "left xworkspaces-1 right";
	modules-right = "";
	wm-restock = "i3";
      };

      "settings" = {
	screenschange-reload = true;
	pseudo-transparency = true;
      };

# Modules {{{

      "module/filesystem" = {
	type = "internal/fs";
	interval = 25;
	mount-0 = "/";
	format-mounted-prefix = " ";
	format-mounted-prefix-background = "${bg-1}";
	format-mounted-prefix-foreground = "${purple-2}";
	label-mounted = "%used%";
	label-mounted-background = "${bg-1}";
	label-mounted-foreground = "${fg-1}";
      };

      "module/cpu" = {
	type = "internal/cpu";
	interval = 2;
	format-prefix = " ";
	format-prefix-foreground = "${cyan-2}";
	format-backgroud = "${bg-1}";
	format = "<label>";
	label = "%percentage%%";
	label-foreground = "${fg-1}";
      };

      "module/temperature" = {
	type = "internal/temperature";
	interval = 1;
	thermal-zone = 1;
	warn-temperature = 80;
	units = true;
	format = "<label>";
	format-prefix = " ";
	format-prefix-background = "${bg-1}";
	format-prefix-foreground = "${blue-2}";
	format-warn = "<label-warn>";
	format-warn-prefix = " ";
	format-warn-prefix-background = "${bg-1}";
	format-warn-prefix-foreground = "${yellow-3}";
	label = "%temperature-c%";
	label-background = "${bg-1}";
	label-foreground = "${fg-1}";
	label-warn = "%temperature-c%";
	label-warn-background = "${bg-1}";
	label-warn-foreground = "${fg-1}";
      };

      "module/memory" = {
	type = "internal/memory";
	interval = 2;
	format-prefix = " ";
	format-prefix-background = "${bg-1}";
	format-prefix-foreground = "${red-2}";
	format-background = "${bg-1}";
	label = "%percentage_used:2%%";
	label-foreground = "${fg-1}";

      };

      "module/network" = {
	type = "internal/network";
	interface-type = "wired";
	interval = "1.0";
	format-connected = "<label-connected>";
	format-connected-background = "${bg-1}";
	format-connected-foreground = "${fg-1}";
	format-disconnected = "<label-disconnected>";
	format-disconnected-background = "${bg-1}";
	format-disconnected-foreground = "${fg-1}";
	label-connected = "%upspeed% %downspeed%";
	label-connected-background = "${bg-1}";
	label-connected-foreground = "${fg-1}";
	label-disconnected-prefix = "睊 ";
	label-disconnected-prefix-foreground = "${red-2}";
	label-disconnected = "Offline";
	label-disconnected-background = "${bg-1}";
	label-disconnected-foreground = "${fg-1}";
      };

      "module/xworkspaces-0" = {
      	type = "internal/xworkspaces";
	icon-0 = "1;I";
	icon-1 = "2;II";
	icon-2 = "3;III";
	icon-3 = "4;IV";
	icon-4 = "5;V";
	label-active = "%icon%";
	label-active-background = "${bg-1}";
	label-active-foreground= "${blue-2}";
	label-active-padding = 1;
	label-occupied = "%icon%";
	label-occupied-padding = 1;
	label-occupied-background = "${bg-1}";
	label-urgent = "%icon%";
	label-urgent-background = "${bg-1}";
	label-urgent-foreground = "${red-1}";
	label-urgent-padding = 1;
	label-empty = "%icon%";
	label-empty-background = "${bg-1}";
	label-empty-foreground = "${fg-1}";
	label-empty-padding = 1;
      };

      "module/xworkspaces-1" = {
      	type = "internal/xworkspaces";
	icon-0 = "6;VI";
	icon-1 = "7;VII";
	icon-2 = "8;VIII";
	icon-3 = "9;IX";
	icon-4 = "0;X";
	label-active = "%icon%";
	label-active-background = "${bg-1}";
	label-active-foreground= "${blue-2}";
	label-active-padding = 1;
	label-occupied = "%icon%";
	label-occupied-padding = 1;
	label-occupied-background = "${bg-1}";
	label-urgent = "%icon%";
	label-urgent-background = "${bg-1}";
	label-urgent-foreground = "${red-1}";
	label-urgent-padding = 1;
	label-empty = "%icon%";
	label-empty-background = "${bg-1}";
	label-empty-foreground = "${fg-1}";
	label-empty-padding = 1;
      };

      "module/xwindows" = {
	type = "internal/xwindow";
	label = "%title:0:60:...%";
	format-background = "${bg-1}";
	format-foreground = "${green-2}";
	label-maxlen = 50;
      };

      "module/date" = {
	type = "internal/date";
	interval = 5;
	label-background = "${bg-1}";
	label-foreground = "${fg-1}";
	time = "%d-%m-%Y";
	label = "%time%";
      };

      "module/time" = {
	type = "internal/date";
	interval = 1;
	format-prefix = "󰅐  ";
	format-prefix-background = "${bg-1}";
	format-prefix-foreground = "${blue-3}";
	label-background = "${bg-1}";
	label-foreground = "${fg-1}";
	time = "%H:%M"; 
	label = "%time%";
      };

      "module/slash" = {
	type = "custom/text";
	content = "/";
	content-background = "${bg-1}";
	content-foreground = "${bg-4}";
	content-font = 3;
      };

      "module/line" = {
	type = "custom/text";
	content = "|";
	content-background = "${bg-1}";
	content-foreground = "${fg-1}";
	content-font = 3;
      };

      "module/space" = {
	type = "custom/text";
	content = " ";
	content-background = "${bg-1}";
	content-foreground = "${bg-1}";
      };

      "module/left" = {
	type = "custom/text";
	content-background = "${bg-4}";
	content-foreground = "${bg-1}";
	content-font = 2;
	content = "%{T3}%{T-}";
      };

      "module/right" = {
	type = "custom/text";
	content-background = "${bg-4}";
	content-foreground = "${bg-1}";
	content-font = 2;
	content = "%{T3}%{T-}";
      };

      "module/pulseaudio" = {
	type = "internal/pulseaudio";
	use-ui-max = false;
	interval = 1;
	format-volume = "<label-volume>";
	format-volume-prefix = "  ";
	format-volume-prefix-background = "${bg-1}";
	format-volume-prefix-foreground = "${purple-2}";
	label-volume = "%percentage%%";
	label-volume-background = "${bg-1}";
	label-volume-foreground = "${fg-3}";
	format-muted = "<label-muted>";
	label-muted = "ﱝ ";
	label-muted-background = "${bg-1}";
	label-muted-foreground = "${red-3}";
      };

# }}}

    };
  };
}
