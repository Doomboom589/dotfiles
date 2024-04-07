{ pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi.override { plugins = [ pkgs.rofi-emoji ]; };
    theme = ./rofi/theme.rasi;
  };
  xdg.configFile = {
    "rofi/powermenu.sh" = {
      source = ./rofi/powermenu.sh;
      executable = true;
    };
    "rofi/powermenu-theme.rasi".source = ./rofi/powermenu-theme.rasi;
  };
}
