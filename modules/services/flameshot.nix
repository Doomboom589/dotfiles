{ pkgs, ... }:
{
  services.flameshot = {
    enable = true;
    package = pkgs.flameshot;
  };
}
