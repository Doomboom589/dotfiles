{ pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi.override { plugins = [ pkgs.rofi-emoji ]; };
    theme = ./rofi/theme.rasi;
  };
}
