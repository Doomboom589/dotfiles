{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 44;
        spacing = 4;
        modules-left = [
          "image#nix-logo"
          "hyprland/workspaces"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "network#speed"
          "network#name"
          "bluetooth"
          "backlight"
          "pulseaudio"
          "battery"
        ];

        # left
        "image#nix-logo" = {
          path = ./assets/nixos.png;
          size = 28;
        };

        "hyprland/workspaces" = {
          format = "{icon} ";
          format-icons = {
            active = "";
            default = "";
          };
          persistent-workspaces = {
            "*" = 10;
          };
        };

        # center
        "clock" = {
          interval = 1;
          format = "{:%Y-%m-%dT%H:%M:%S}";
        };

        # right
        "battery" = {
          bat = "BAT1";
          interval = 60;
          format = "{capacity}% {icon} ";
          format-icons = [ "" "" "" "" "" ];
        };

        "pulseaudio" = {
          format = "{volume}% {icon} ";
          format-icons = {
            default = [ "" "" ];
          };
        };

        "backlight" = {
          format = "{percent}% {icon} ";
          format-icons = [ "" "" ];
          on-scroll-up = "brightnessctl s +1%";
          on-scroll-down = "brightnessctl s 1%-";
        };

        "network#name" = {
          interval = 10;
          format-wifi = "{essid}  ";
          format-disconnected = "disconnected 󱚼 ";
        };

        "bluetooth" = {
	      format = "{status} ";
          format-disabled = "";
          format-connected = "{num_connections} connected ";
          tooltip-format = "{controller_alias}\t{controller_address}";
          tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
        };

        "network#speed" = {
          interval = 1;
          format = "{bandwidthDownBits}   {bandwidthUpBits}  ";
        };
      };
    };
    style = ./waybar.css;
  };
}
