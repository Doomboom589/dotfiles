{ imputs, pkgs, ... }:
{
  imports = [
    ./fish.nix
    ./starship.nix
    ./kitty.nix
  ];
}
