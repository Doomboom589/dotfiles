{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    package = pkgs.fish;
    functions = { };
    plugins = [ ];
    shellAbbrs = {
      ls = "ls -l";
    };
  };
}
