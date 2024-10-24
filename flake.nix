{
  description = "Modular NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    catppuccin.url = "github:catppuccin/nix";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "unstable";

    plasma-manager.url = "github:nix-community/plasma-manager";
    plasma-manager.inputs.nixpkgs.follows = "unstable";
    plasma-manager.inputs.home-manager.follows = "home-manager";

    lanzaboote.url = "github:nix-community/lanzaboote";
    lanzaboote.inputs.nixpkgs.follows = "unstable";

    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "unstable";

    libations.url = "github:jnsgruk/libations";
    libations.inputs.nixpkgs.follows = "unstable";

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    nix-vscode-extensions.inputs.nixpkgs.follows = "unstable";
    vscode-server.url = "github:nix-community/nixos-vscode-server";
    vscode-server.inputs.nixpkgs.follows = "unstable";

    firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    firefox-addons.inputs.nixpkgs.follows = "unstable";
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

