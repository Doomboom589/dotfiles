{ pkgs, ... }:
{
  services.picom = {
    enable = true;
    package = pkgs.picom;
    activeOpacity = 1.0;
    backend = "glx";
    fade = true;
    fadeDelta = 10;
    fadeExclude = [ ];
    fadeSteps = [
      0.07
      0.07
    ];
    inactiveOpacity = 1.0;
    menuOpacity = 0.8;
    opacityRule = [
      "85:class_g = 'kitty'"
    ];
    settings = {
      blur = {
	method = "dual_kawase";
	size = 50;
	strength = 1;
	background = true;
      };
      frame-opacity = 1.0;
      corner-radius = 8;
      rounded-corners-exclude = [
	"window_type = 'desktop'"
      ];
    };
    shadow = true;
    ShadowExclude = [
      "name = 'Notification'"
    ];
    shadowOffsets = [
      -25
      -25
    ];
    shadowOpacity = 0.75;
    vSync = true;
  };
}
