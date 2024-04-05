{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    package = pkgs.fish;
    functions = { };
    plugins = [ ];
    interactiveShellInit = "tmux";
    shellAbbrs = {
      ls = "ls -a";
    };
  };
}
