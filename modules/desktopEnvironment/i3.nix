# vim:fileencoding=utf-8:foldmethod=marker

{ config, lib, pkgs, ... }:
with lib;
let
  mod = "Mod4";
in {
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = {
      modifier = mod;

      terminal = "kitty";

      fonts = {
        names = [ "Monaspace Krypton" ];
	style = "Med";
	size = 9.0;
      };

      focus = {
	followMouse = true;
	newWindow = "smart";
      };

      gaps = {
	inner = 13;
	outer = 6;
	smartBorders = "on";
      };

      window.commands = [
	{
	  command = "border pixel 0";
	  criteria.class = ".*";
	}
      ]; 

      workspaceAutoBackAndForth = true;

# Startup {{{

      startup = [
        {
	  command = "systemctl --user restart polybar.service";
	  always = true;
	  notification = false;
        }
        {
	  command = "find ~/nixos/modules/desktopEnvironment/wallpapers -type f ( -name '.jpg' -o -name '.png' ) -print0 | shuf -n1 -z | xargs -0 ${pkgs.feh}/bin/feh --bg-fill --no-xinerama";
	  always = true;
	  notification = false;
        }
      ];

# }}}

# Keybinds {{{

      keybindings = lib.mkDefault {
        # Screenshot
	"Print" = "exec --no-startup-id sh -c '${pkgs.flameshot}/bin/flameshot gui'";
        
	# Audio
	"XF86AudioRaiseVolume" = "exec --no-startup-id wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+";
	"XF86AudioLowerVolume" = "exec --no-startup-id wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-";
	"XF86AudioMute" = "exec --no-startup-id wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
	"XF86AudioMicMute" = "exec --no-startup-id wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";

	# Brightness
	"XF86MonBrightnessDown" = "exec brightnessctl set 4%-";
        "XF86MonBrightnessUp" = "exec brightnessctl set 4%+";

	# Spawn terminal
	"${mod}+Return" = "exec kitty";

	# Kill window
	"${mod}+Shift+c" = "kill";

	# Rofi
	"${mod}+d" = "exec ${pkgs.rofi}/bin/rofi -show drun";

	# Eww power menu
	"${mod}+Shift+p" = "exec ${pkgs.eww}/bin/eww open powermenu";
	# "{mod}+Ctrl+p" = "exec ${pkgs.eww}/bin/eww close powermenu";

	# Focus
	"${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";

	"${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";

	"${mod}+space" = "focus mode_toggle";

	# Split
	"${mod}+Ctrl+h" = "split h";
	"${mod}+Ctrl+v" = "split v";

	# Layout
	"${mod}}+w" = "layout tabbed";
	"${mod}}+s" = "layout toggle split";
	"${mod}+Shift+space" = "floating toggle";

	# Workspaces
	"${mod}+1" = "workspace number $ws1";
	"${mod}+2" = "workspace number $ws2";
	"${mod}+3" = "workspace number $ws3";
	"${mod}+4" = "workspace number $ws4";
	"${mod}+5" = "workspace number $ws5";
	"${mod}+6" = "workspace number $ws6";
	"${mod}+7" = "workspace number $ws7";
	"${mod}+8" = "workspace number $ws8";
	"${mod}+9" = "workspace number $ws9";
	"${mod}+0" = "workspace number $ws0";

	# Move to workspace
	"${mod}+Shift+1" = "move container to workspace number $ws1";
	"${mod}+Shift+2" = "move container to workspace number $ws2";
	"${mod}+Shift+3" = "move container to workspace number $ws3";
	"${mod}+Shift+4" = "move container to workspace number $ws4";
	"${mod}+Shift+5" = "move container to workspace number $ws5";
	"${mod}+Shift+6" = "move container to workspace number $ws6";
	"${mod}+Shift+7" = "move container to workspace number $ws7";
	"${mod}+Shift+8" = "move container to workspace number $ws8";
	"${mod}+Shift+9" = "move container to workspace number $ws9";
	"${mod}+Shift+0" = "move container to workspace number $ws0";

	# Modes
	"${mod}+r" = "mode \"resize\"";

	# Restart i3
	"${mod}+Shift+r" = "restart";
      };

# }}}

# Modes {{{

      modes = {
	resize = {
	  Down = "resize grow height 10 px or 10 ppt";
	  Escape = "mode default";
	  Left = "resize shrink width 10 px or 10 ppt";
	  Return = "mode default";
	  Right = "resize grow width 10 px or 10 ppt";
	  Up = "resize shrink height 10 px or 10 ppt";
	};
      };

# }}}

# Colours {{{

      colors = { 
	background = "#12121F";
	focused = {
	  background = "#12121F";
	  border = "#83A8EC";
	  childBorder = "#8983D8";
	  indicator = "#83A8EC";
	  text = "#D4D7FF";
	};

	focusedInactive = {
	  background = "#12121F";
	  border = "#D4D7FF";
	  childBorder = "#D0D3FF";
	  indicator = "#D4D7FF";
	  text = "#D4D7FF";
	};

	placeholder = {
	  background = "#12121F";
	  border = "#12121F";
	  childBorder = "#222236";
	  indicator = "#12121F";
	  text = "#D4D7FF";
	};

	unfocused = {
	  background = "#12121F";
	  border = "#D0D3FF";
	  childBorder = "#CCCFFF";
	  indicator = "#D0D3FF";
	  text = "#D4D7FF";
	};

	urgent = {
	  background = "#DA587D";
	  border = "#DE688A";
	  childBorder = "#DA587D";
	  indicator = "#D0D3FF";
	  text = "#D4D7FF";
	};
      };
# }}}
    };
  };
}
