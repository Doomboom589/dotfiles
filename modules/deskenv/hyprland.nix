{ pkgs, ... }:
{
/* xdg.configFile.hypr = {
    source = ./hyprpaper;
    recursive = true;
  }; */

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    systemd.enable = true;
    settings = {
      monitor = [
        ",2560x1440@,0x0,1"
      ];

      env = [
        "WLR_NO_HARDWARE_CURSORS,1"
        "NIXOS_OZONE_WL,1" 
      ];

      exec-once = [
        "waybar"
      ];

      input = {
        follow_mouse = true;
        touchpad = {
          natural_scroll = true;
        };
        accel_profile = "flat";
      };

      gestures = {
        workspace_swipe = true;
      };
      
      general = {
        border_size = 3;
        "col.active_border" = "rgb(cba6f7)";
        "col.inactive_border" = "rgb(6c7086)";
      };

      decoration = {
        rounding = 5;
        drop_shadow = false;
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };

      "$mod" = "SUPER";
      bind =
        [
	  "$mod SHIFT, q, exit"
	  "$mod, t, exec, kitty"
          "$mod SHIFT, c, killactive"
          "$mod, d, exec, wofi --show drun"
          "$mod, p, exec, wofi --show run"
          # windows
          "$mod, h, movefocus, l"
          "$mod, l, movefocus, r"
          "$mod, j, movefocus, d"
          "$mod, h, movefocus, u"
          "$mod SHIFT, h, resizeactive, -10 0"
          "$mod SHIFT, l, resizeactive, 10 0"
          "$mod SHIFT, j, resizeactive, 0 -10"
          "$mod SHIFT, h, resizeactive, 0 10"
          "$mod, v, togglefloating"
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
          builtins.concatLists (builtins.genList (
            x: let
              ws = let
                c = (x + 1) / 10;
              in
                builtins.toString (x + 1 - (c * 10));
            in [
              "$mod, ${ws}, workspace, ${toString (x + 1)}"
              "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ]
          )
          10)
        );

        bindm = [
          "$mod,mouse:272,movewindow"
          "$mod ALT,mouse:272,resizewindow"
        ];
    };
  };
}
