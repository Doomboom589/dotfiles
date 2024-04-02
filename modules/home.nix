# vim:fileencoding=utf-8:foldmethod=marker

{ config, pkgs, ... }:

{
# User Info {{{

  # User info
  home.username = "oliver";
  home.homeDirectory = "/home/oliver";

# }}}

# Packages {{{
 
  # Common packages 
  home.packages = [
    git
    wget
    neovim
    xdg-desktop-portal-hyprland
    waybar
    discord
    spotify
    librewolf
    btop
    kitty
    fish
    tmux
    wofi
    wlogout
  ];

  home.file = {
  };

# }}}

# Home Manager {{{

  home.sessionVariables = {
    # EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager Version
  home.stateVersion = "23.11";

# }}}
}
