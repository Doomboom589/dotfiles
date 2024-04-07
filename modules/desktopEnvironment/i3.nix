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
  workspace = { "a" = "1:󰎤 "; "b" = "2:󰎧 "; "c" = "3:󰎪 "; "d" = "4:󰎭 "; "e" = "5:󰎱 "; "f" = "6:󰎳 "; "g" = "7:󰎶 "; "h" = "8:󰎹 "; "i" = "9:󰎼 "; "j" = "0:󰎡 "; };
in {
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    # assigns workspaces in extraConfig
    extraConfig =
    ''
      workspace ${workspace.a} output DP-0 HDMI-1
      workspace ${workspace.b} output DP-0 HDMI-1
      workspace ${workspace.c} output DP-0 HDMI-1
      workspace ${workspace.d} output DP-0 HDMI-1
      workspace ${workspace.e} output DP-0 HDMI-1
      workspace ${workspace.f} output DP-4 DP-2
      workspace ${workspace.g} output DP-4 DP-2
      workspace ${workspace.h} output DP-4 DP-2
      workspace ${workspace.i} output DP-4 DP-2
      workspace ${workspace.j} output DP-4 DP-2
    '';
    config = {
      modifier = mod;

# Bar {{{

      bars = [
	{ 
	  mode = "dock"; 
	  statusCommand = "${pkgs.i3blocks}/bin/i3blocks -c ~/.config/i3blocks/top";
	  position = "top";
	  extraConfig = "strip_workspace_numbers yes";
	  fonts = {
	    # Automatically uses pango without need to mention it because pango is installed
	    names = [ "Monaspace Krypton" ];
	    style = "Medium";
  	    size = 13.0;
	  };
	  trayOutput = "DP-0";
	  trayPadding = 1;
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

# }}}

      terminal = "kitty";

      fonts = {
	# Automatically uses pango without need to mention it because pango is installed
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

      window = {
        commands = [
	  {
	    command = "border pixel 0";
	    criteria.class = ".*";
	  }
        ]; 
        border = 4;
      };

# Startup {{{

      startup = [
        {
	  command = "shuf -e -n1 $HOME/.config/wallpapers/* | xargs ${pkgs.feh}/bin/feh --bg-scale";
	  always = true;
	  notification = false;
        }
      ];

# }}}

# Keybinds {{{ 

      keycodebindings = {
      # Workspaces
	# Switch to workspace
	"${mod}+10" = "workspace ${workspace.a}";
	"${mod}+11" = "workspace ${workspace.b}";
	"${mod}+12" = "workspace ${workspace.c}";
	"${mod}+13" = "workspace ${workspace.d}";
	"${mod}+14" = "workspace ${workspace.e}";
	"${mod}+15" = "workspace ${workspace.f}";
	"${mod}+16" = "workspace ${workspace.g}";
	"${mod}+17" = "workspace ${workspace.h}";
	"${mod}+18" = "workspace ${workspace.i}";
	"${mod}+19" = "workspace ${workspace.j}";

	# Switch to workspace with numpad
	"${mod}+87" = "workspace ${workspace.a}";
	"${mod}+88" = "workspace ${workspace.b}";
	"${mod}+89" = "workspace ${workspace.c}";
	"${mod}+83" = "workspace ${workspace.d}";
	"${mod}+84" = "workspace ${workspace.e}";
	"${mod}+85" = "workspace ${workspace.f}";
	"${mod}+79" = "workspace ${workspace.g}";
	"${mod}+80" = "workspace ${workspace.h}";
	"${mod}+81" = "workspace ${workspace.i}";
	"${mod}+90" = "workspace ${workspace.j}";

	# Switch to workspace with numlock numpad
	"${mod}+Mod2+87" = "workspace ${workspace.a}";
	"${mod}+Mod2+88" = "workspace ${workspace.b}";
	"${mod}+Mod2+89" = "workspace ${workspace.c}";
	"${mod}+Mod2+83" = "workspace ${workspace.d}";
	"${mod}+Mod2+84" = "workspace ${workspace.e}";
	"${mod}+Mod2+85" = "workspace ${workspace.f}";
	"${mod}+Mod2+79" = "workspace ${workspace.g}";
	"${mod}+Mod2+80" = "workspace ${workspace.h}";
	"${mod}+Mod2+81" = "workspace ${workspace.i}";
	"${mod}+Mod2+90" = "workspace ${workspace.j}";

	# Move window to workspace
	"${mod}+Shift+10" = "move container to workspace ${workspace.a}";
	"${mod}+Shift+11" = "move container to workspace ${workspace.b}";
	"${mod}+Shift+12" = "move container to workspace ${workspace.c}";
	"${mod}+Shift+13" = "move container to workspace ${workspace.d}";
	"${mod}+Shift+14" = "move container to workspace ${workspace.e}";
	"${mod}+Shift+15" = "move container to workspace ${workspace.f}";
	"${mod}+Shift+16" = "move container to workspace ${workspace.g}";
	"${mod}+Shift+17" = "move container to workspace ${workspace.h}";
	"${mod}+Shift+18" = "move container to workspace ${workspace.i}";
	"${mod}+Shift+19" = "move container to workspace ${workspace.j}";

	# Move window to workspace with numpad
	"${mod}+Shift+87" = "move container to workspace ${workspace.a}";
	"${mod}+Shift+88" = "move container to workspace ${workspace.b}";
	"${mod}+Shift+89" = "move container to workspace ${workspace.c}";
	"${mod}+Shift+83" = "move container to workspace ${workspace.d}";
	"${mod}+Shift+84" = "move container to workspace ${workspace.e}";
	"${mod}+Shift+85" = "move container to workspace ${workspace.f}";
	"${mod}+Shift+79" = "move container to workspace ${workspace.g}";
	"${mod}+Shift+80" = "move container to workspace ${workspace.h}";
	"${mod}+Shift+81" = "move container to workspace ${workspace.i}";
	"${mod}+Shift+90" = "move container to workspace ${workspace.j}";

	# Move window to workspace with numlock numpad
	"${mod}+Mod2+Shift+87" = "move container to workspace ${workspace.a}";
	"${mod}+Mod2+Shift+88" = "move container to workspace ${workspace.b}";
	"${mod}+Mod2+Shift+89" = "move container to workspace ${workspace.c}";
	"${mod}+Mod2+Shift+83" = "move container to workspace ${workspace.d}";
	"${mod}+Mod2+Shift+84" = "move container to workspace ${workspace.e}";
	"${mod}+Mod2+Shift+85" = "move container to workspace ${workspace.f}";
	"${mod}+Mod2+Shift+79" = "move container to workspace ${workspace.g}";
	"${mod}+Mod2+Shift+80" = "move container to workspace ${workspace.h}";
	"${mod}+Mod2+Shift+81" = "move container to workspace ${workspace.i}";
	"${mod}+Mod2+Shift+90" = "move container to workspace ${workspace.j}";
      };

      keybindings = {
	# Workspaces
	"${mod}+Tab" = "workspace next";
	"${mod}+Shift+Tab" = "workspace prev";
	
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
	"${mod}+Shift+p" = "exec ${pkgs.rofi}/bin/rofi -show power-menu -modi \"power-menu:$HOME/.local/bin/rofi-power-menu --choices=logout/shutdown/reboot\"";

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
	"${mod}+f" = "fullscreen toggle";

	# Restart i3
	"${mod}+Shift+r" = "restart";
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
