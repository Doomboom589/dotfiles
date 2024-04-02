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
    nixvim-flake.url = "./modules/programs/nixvim";
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
	./modules/desktop.nix
        inputs.home-manager.nixosModules.default
      ];
    };
  };
}
