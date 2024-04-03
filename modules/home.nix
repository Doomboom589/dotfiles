# vim:fileencoding=utf-8:foldmethod=marker

{ config, pkgs, ... }:

{
# User Info {{{

  # User info
  home.username = "oliver";
  home.homeDirectory = "/home/oliver";

# }}}

# Imports {{{

  imports = [
    ./desktopEnvironment/modules.nix
    ./programs/modules.nix
  ];

# }}}

# Packages {{{
 
  # Common packages 
  home.packages = with pkgs; [
    # Terminal
    git
    wget
    #fish
    tmux
    kitty
    btop
    neofetch
    spicetify-cli
    brightnessctl
    # Desktop environment
    #i3-gaps
    #polybar
    #eww
    #dunst
    gtk2
    gtk3
    #picom
    #rofi
    # Fonts
    fira-code-nerdfont
    monaspace
    # Applications
    steam
    discord
    spotify
    librewolf
    #flameshot
    feh
  ];

  home.file = {
  };

  nixpkgs.config = {
    allowUnfree = true;
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
