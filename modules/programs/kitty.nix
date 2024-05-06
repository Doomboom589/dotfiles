{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    font = {
      name = "Firacode Nerd Font Mono";
      size = 16;
    };
    theme = "Monokai Soda";
    package = pkgs.kitty;
    shellIntegration.enableFishIntegration = true;
  };
}
