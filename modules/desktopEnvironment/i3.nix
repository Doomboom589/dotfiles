# vim:fileencoding=utf-8:foldmethod=marker

{ config, lib, pkgs, ... }:
with lib;
let
  mod = "Mod4";
  bg-1 = "#12121f";
  blue-2 = "#729ce9";
  fg-1 = "#daddff";
  red-2 = "#da587d";
  grey-2 = "#595b7e";
in {
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = {
      modifier = mod;

      bars = [
	{ 
	  mode = "dock"; 
	  statusCommand = "${pkgs.i3blocks}/bin/i3blocks -c ~/.config/i3blocks/top";
	  position = "top";
	  fonts = {
	    names = [ "Monaspace Krypton" ];
	    style = "Medium";
  	    size = 13.0;
	  };
	  colors = {
	    background = "${bg-1}";
	    statusline = "${fg-1}";
	    separator = "${bg-1}";
	    
	    activeWorkspace = {
	      background = "${bg-1}";
	      border = "${bg-1}";
	      text = "${fg-1}";
	    };
	    inactiveWorkspace = {
	      background = "${bg-1}";
	      border = "${bg-1}";
	      text = "${grey-2}";
	    };
	    urgentWorkspace = {
	      background = "${bg-1}";
	      border = "${bg-1}";
	      text = "${red-2}";
	    };
	    focusedWorkspace = {
	      background = "${bg-1}";
	      border = "${bg-1}";
	      text = "${blue-2}";
	    };
	    bindingMode = {
	      background = "${bg-1}";
	      border = "${bg-1}";
	      text = "${red-2}";
	    };
	  };
	}
      ];

      terminal = "kitty";

      fonts = {
        names = [ "Monaspace Krypton" ];
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

      workspaceOutputAssign = [
	{
	  workspace = "I";
	  output = "DP-4";
	}
	{
	  workspace = "II";
	  output = "DP-4";
	}
	{
	  workspace = "III";
	  output = "DP-4";
	}
	{
	  workspace = "IV";
	  output = "DP-4";
	}
	{
	  workspace = "V";
	  output = "DP-4";
	}
	{
	  workspace = "VI";
	  output = "DP-0";
	}
	{
	  workspace = "VII";
	  output = "DP-0";
	}
	{
	  workspace = "VIII";
	  output = "DP-0";
	}
	{
	  workspace = "IX";
	  output = "DP-0";
	}
	{
	  workspace = "X";
	  output = "DP-0";
	}
      ];

# Startup {{{

      startup = [
        {
	  command = "${pkgs.feh}/bin/feh --bg-fill --no-xinerama --randomize ~/nixos/modules/desktopEnvironment/wallpapers/*";
	  always = true;
	  notification = false;
        }
      ];

# }}}

# Keybinds {{{

      keybindings = lib.mkOptionDefault {
        # Screenshot
	"Print" = "exec --no-startup-id sh -c '${pkgs.flameshot}/bin/flameshot gui'";
        
	# Audio
	"XF86AudioRaiseVolume" = "exec --no-startup-id wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+";
	"XF86AudioLowerVolume" = "exec --no-startup-id wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-";
	"XF86AudioMute" = "exec --no-startup-id wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
	"XF86AudioMicMute" = "exec --no-startup-id wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";

	# Brightness
	"XF86MonBrightnessDown" = "exec --no-startup-id brightnessctl set 4%-";
        "XF86MonBrightnessUp" = "exec --no-startup-id brightnessctl set 4%+";

	# Spawn terminal
	"${mod}+Return" = "exec kitty";

	# Kill window
	"${mod}+Shift+c" = "kill";

	# Rofi
	"${mod}+d" = "exec ${pkgs.rofi}/bin/rofi -show drun";

	# Rofi power menu
	"${mod}+Shift+p" = "exec ${pkgs.rofi}/bin/rofi -show menu -modi 'menu:rofi-power-menu'";

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
	"${mod}+Shift+space" = "floating toggle";

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
