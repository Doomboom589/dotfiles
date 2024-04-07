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
    ./services/modules.nix
  ];

# }}}

# Packages {{{
 
  # Common packages 
  home.packages = with pkgs; [
    # Terminal
    git
    wget
    tmux
    btop
    neofetch
    kitty
    spicetify-cli
    brightnessctl
    gh
    onefetch
    cava
    cowsay
    pipes
    lolcat
    # Desktop environment
    gtk3
    # Fonts
    fira-code-nerdfont
    monaspace
    # Icons
    kora-icon-theme
    # Applications
    steam
    discord
    spotify
    librewolf
    feh
    pango
    rofi-power-menu
    krita
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
