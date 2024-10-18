{
  description = "Modular NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    catppuccin.url = "github:catppuccin/nix";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "unstable";
    plasma-manager.url = "github:nix-community/plasma-manager";
    plasma-manager.inputs.nixpkgs.follows = "unstable";

    lanzaboote.url = "github:nix-community/lanzaboote";
    lanzaboote.inputs.nixpkgs.follows = "unstable";

    libations.url = "github:jnsgruk/libations";
    libations.inputs.nixpkgs.follows = "unstable";
  };

  outputs = { self, nixpkgs, unstable, ... }@inputs:
  let
    inherit (self) outputs;
    stateVersion = "24.05";
    username = "tristan";

    libx = import ./lib {
      inherit self inputs outputs stateVersion username;
    };
  in {
    homeConfigurations = {
      "${username}@vm" = libx.mkHome {
        hostname = "vm";
	desktop = "plasma";
	system = "x86_64-linux";
        user = username;
      };
    };
    nixosConfigurations = {
      vm = libx.mkHost {
        hostname = "vm";
        desktop = "plasma";
        pkgsInput = inputs.nixpkgs;
      };
    };
  };
}

