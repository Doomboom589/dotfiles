{ pkgs, ... }:
{
  services.picom = {
    enable = true;
    package = pkgs.picom;
    activeOpacity = 1.0;
    backend = "glx";
    fade = false;
    inactiveOpacity = 1.0;
    menuOpacity = 0.8;
    opacityRules = [
      "85:class_g = 'kitty'"
    ];
    settings = {
      blur = {
	method = "dual_kawase";
	size = 50;
	strength = 5;
	background = true;
      };
      frame-opacity = 1.0;
      corner-radius = 8;
      rounded-corners-exclude = [
	"window_type = 'dock'"
      ];
    };
    shadow = true;
    shadowOpacity = 0.75;
    shadowOffsets = [
      (-15)
      (-10)
    ];
    vSync = true;
  };
}
