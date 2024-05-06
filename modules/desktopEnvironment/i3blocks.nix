{ pkgs, ... }:
let
  bg-1 = "#12121f";
  bg-4 = "#222236";
  fg-1 = "#daddff";
  fg-5 = "#cccfff";
  grey-1 = "#4f5071";
  red-2 = "#da587d";
  purple-2 = "#8983d8";
  purple-3 = "#7a73d3";
  blue-2 = "#729ce9";
  blue-3 = "#608fe6";
  green-3 = "#6fd89e";
in
{
  programs.i3blocks = {
    enable = true;
    package = pkgs.i3blocks;
    bars = {
      top = {
        "0-spotify" = {
	  command = "if pgrep \"spotify\" > /dev/null; then echo \"<span foreground='${green-3}' background='${bg-1}' size='x-large'> </span><span foreground='${bg-4}' background='${green-3}' rise='2pt'><span size='large' > 󰝚 </span>$(dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' | grep -A 2 \"artist\" | tail -n 1 | grep -o '\".*\"' | sed 's/\"//g' | sed 's/&/&amp;/') - $(dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' | grep -A 1 \"title\" | tail -n 1 | grep -o '\".*\"' | sed 's/\"//g' | sed 's/&/&amp;/')<span size='large' > 󰝚 </span></span><span foreground='${blue-2}' background='${green-3}' size='x-large'> </span>\"; else echo \"<span foreground='${blue-2}' background='${bg-1}' size='x-large'> </span>\"; fi";
	  markup = "pango";
	  interval = 1;
	  separator_block_width = 0;
	};
	"1-disk" = {
	  command = "echo \"<span background='${bg-1}'><span background='${blue-2}' foreground='${grey-1}' size='large' rise='2pt'>  </span><span background='${blue-2}' foreground='${fg-1}' size='small' rise='2pt'> / </span><span background='${blue-2}' size='small' rise='2pt'>$(df -h | grep \"/$\" | awk '{print $5}') </span></span>\"";
	  markup = "pango";
	  interval = 30;
	  separator_block_width = 0;
        };
        "2-volume-pulseaudio" = {
	  command = "wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep 0 > /dev/null && echo \"<span background='${blue-2}' foreground='${blue-3}' size='x-large'></span><span background='${blue-3}' foreground='${fg-1}' size='large' rise='2pt'>   </span><span background='${blue-3}' size='small' rise='2pt'> $(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}' | sed 's/0\\.//g')%</span>\" || echo \"<span foreground='${red-2}' size='large' rise='2pt'>  ﱝ </span>\"";
	  markup = "pango";
	  interval = 1;
	  separator_block_width = 0;
        };
	"3-date" = {
	  command = "echo \"<span foreground='${purple-2}' background='${blue-3}' size='x-large'> </span><span background='${purple-2}' foreground='${fg-1}' size='medium' rise='3pt'>    </span><span background='${purple-2}' foreground='${fg-1}' size='small' rise='2pt'>$(date +\"%Y-%m-%d\")</span>\"";
	  markup = "pango";
	  interval = 1;
	  separator_block_width = 0;
	};
	"4-time" = {
	  command="echo \"<span foreground='${purple-3}' background='${purple-2}' size='x-large'> </span><span background='${purple-3}'> <span foreground='${fg-1}' size='large' rise='2pt'>  </span> <span background='${purple-3}' foreground='${fg-1}' size='small' rise='2pt'>$(date +\"%H:%M:%S\")</span> </span>\"";
	  markup = "pango";
	  interval = 1;
	  separator_block_width = 0;
	};
	"5-rofi-powermenu" = {
	  command = "echo \"<span background='${purple-3}' foreground='${red-2}' size='x-large'> </span><span background='${red-2}' foreground='${fg-1}' size='x-small'> </span><span background='${red-2}' foreground='${fg-1}' size='large' rise='2pt'>   </span><span background='${bg-1}' foreground='${red-2}' size='x-large'></span>\"; if [ $button ]; then rofi -show menu -modi 'menu:rofi-power-menu:$HOME/.local/bin/rofi-power-menu --choices=logout/shutdown/reboot'>/dev/null; fi";
	  markup = "pango";
	  interval = 1;
	  separator_block_width = 0;
	};
      };
    }; 
  };
}
