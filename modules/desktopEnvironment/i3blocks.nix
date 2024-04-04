{ pkgs, ... }:
let
  bg-1 = "#12121f";
  bg-2 = "#171728";
  bg-3 = "#1d1d2f";
  bg-4 = "#222236";
  bg-5 = "#29293f";
  fg-1 = "#daddff";
  fg-2 = "#d7daff";
  fg-3 = "#d4d7ff";
  fg-4 = "#d0d3ff";
  fg-5 = "#cccfff";
  grey-1 = "#4f5071";
  grey-2 = "#595b7e";
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
in
{
  programs.i3blocks = {
    enable = true;
    package = pkgs.i3blocks;
    bars = {
      top = {
	disk = {
	  command = "echo \"<span foreground='${purple-2}' background='${bg-1}' size='x-large'> </span><span background='${bg-1}'> <span foreground='${purple-2}' size='large'></span> <span foreground='${fg-1}' size='small' rise='2pt'>/</span> <span size='small' rise='2pt'>$(df -h | grep \"/$\" | awk '{print $5}')</span>  </span><span background='${purple-2}' foreground='${blue-2}' size='x-large'></span>\"";
	  markup = "pango";
	  background = "${bg-1}";
	  color = "${fg-1}";
	  interval = 30;
        };
        volume-pulseaudio = {
	  command = "wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep 0 > /dev/null && echo \"<span foreground='${blue-2}' size='large'></span> <span size='small' rise='2pt'>$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}' | sed 's/0\\.//g')%</span>\" || echo \"<span foreground='${red-2}' size='large'>ﱝ</span>\"";
	  markup = "pango";
	  interval = 1;
        };
	date = {
	  command = "echo \"<span foreground='${green-2}' background='${blue-2}' size='x-large'> </span><span foreground='${bg-1}' size='large'></span> <span size='small' rise='2pt'>$(date +\"%Y-%m-%d\")</span>\"";
	  markup = "pango";
	  interval = 1;
	};
	  time = {
	  command="echo \"<span foreground='${yellow-2}' background='${green-2}' size='x-large'></span><span background='${yellow-2}'> <span foreground='${fg-1}' size='large'></span> <span size='small' rise='2pt'>$(date +\"%H:%M:%S\")</span> </span><span background='${yellow-2}' foreground='{$red-2}' size='x-large'></span>\"";
	  markup = "pango";
	  interval = 1;
	};
	rofi-powermenu = {
	  command = "echo \"<span foreground='${red-2}' size='large'></span> \"; if [ $button ]; then rofi -show menu -modi 'menu:rofi-power-menu' >/dev/null; fi\"";
	  markup = "pango";
	  interval = 1;
	};
      };
    }; 
  };
}
