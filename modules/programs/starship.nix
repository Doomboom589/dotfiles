{ pkgs, ... }:
{
  programs.starship = {
    enable = true;
    package = pkgs.starship;
    enableFishIntegration = true;
    enableTransience = true;
    settings = {
      add_newline = false;
      character = {
	success_symbol = "[❯](bold green)";
	error_symbol = "[❯](bold red)";
      };
    };
  };
}
