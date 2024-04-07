{ pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi.override { plugins = [ pkgs.rofi-emoji ]; };
    theme = ./rofi/theme.rasi;
  };
  # hacky solution to local/bin
  xdg.dataFile = {
    "../bin/rofi-power-menu" = {
      source = ./rofi/rofi-power-menu;
      executable = true;
    };
  };
}
