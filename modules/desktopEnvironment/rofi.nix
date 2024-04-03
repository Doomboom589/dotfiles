{ pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi.override { plugins = [pkgs.rofi-emoji]; };
    location = "center";
    configPath = ./rofi/config.rasi;
    theme = ./rofi/theme.rasi;
  };
}
