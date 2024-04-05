{
  description = "Nixos config flake";

  inputs = {

    # Nixpkgs branch
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nixvim
    nixvim-flake.url = "git+file:///home/oliver/nixos/modules/programs/nixvim";

    # Sddm catppuccin corners theme
    sddm-catppuccin = {
      url = "github:khaneliman/sddm-catppuccin";
      inputs.nixpkgs.follows = "nixpkgs";
      packages.${pkgs.hostPlatform.system}.sddm-catppuccin
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: 
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  { 
    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/desktop/configuration.nix 
        inputs.home-manager.nixosModules.default
        inputs.sddm-catppuccin.packages.${pkgs.hostPlatform.system}.sddm-catppuccin
      ];
    };
  };
}
