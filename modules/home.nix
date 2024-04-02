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
    ./deskenv/default.nix
  ];

# }}}

# Packages {{{
 
  # Common packages 
  home.packages = with pkgs; [
    # Terminal
    git
    wget
    fish
    tmux
    kitty
    btop
    # Applications
    steam
    discord
    spotify
    librewolf
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
