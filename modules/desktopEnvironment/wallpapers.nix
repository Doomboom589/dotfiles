{ ... }:
{
   xdg.configFile = builtins.mapAttrs (fileName: { "wallpapers/${fileName}".source = " ./wallpapers/${fileName}"; }) (builtins.readDir ./modules/desktopEnvironment/wallpapers);
#  xdg.configFile = {
#    "wallpapers/brush.jpg".source = config.lib.file.mkOutOfStoreSymlink ./wallpapers/brush.jpg;
#    "wallpapers/catppuccin_triangle.png".source = config.lib.file.mkOutOfStoreSymlink ./wallpapers/catppuccin_triangle.png;
#    "wallpapers/nix-black-4k.png".source = config.lib.file.mkOutOfStoreSymlink ./wallpapers/nix-black-4k.png;
#    "wallpapers/steps.png".source = config.lib.file.mkOutOfStoreSymlink ./wallpapers/steps.png;
#    "wallpapers/WavesDarkAlt6016x6016.jpg".source = config.lib.file.mkOutOfStoreSymlink ./wallpapers/WavesDarkAlt6016x6016.jpg;
#    "wallpapers/WavesLight6016x6016.jpg".source = config.lib.file.mkOutOfStoreSymlink ./wallpapers/WavesLight6016x6016.jpg;
#  };
}
