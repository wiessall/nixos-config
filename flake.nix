{
  description = "Modular NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    impermanence.url = "github:nix-community/impermanence";
    impermanence.inputs.nixpkgs.follows = "unstable";

    catppuccin.url = "github:catppuccin/nix";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "unstable";

    plasma-manager.url = "github:nix-community/plasma-manager/trunk";
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

    flatpaks.url = "github:GermanBread/declarative-flatpak/stable-v3";
    flatpaks.inputs.nixpkgs.follows = "unstable";
    poetry2nix = { url = "github:nix-community/poetry2nix/2024.5.939250";
            inputs.nixpkgs.follows = "nixpkgs";
    };

#    nix-secrets = {
#      url = "git+ssh://git@github.com/wiessall/nixos-secrets?ref=main&shallow=1";
#      flake = false;
#    };
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
      "${username}@verdi" = libx.mkHome {
        hostname = "verdi";
	desktop = "plasma";
	system = "x86_64-linux";
        user = username;
      };
      "${username}@vivaldi" = libx.mkHome {
        hostname = "vivaldi";
	desktop = "plasma";
	system = "x86_64-linux";
        user = username;
      };    
    };
    nixosConfigurations = {
      verdi = libx.mkHost {
        hostname = "verdi";
        desktop = "plasma";
        pkgsInput = inputs.nixpkgs;
      };
      vivaldi = libx.mkHost {
        hostname = "vivaldi";
        desktop = "plasma";
        pkgsInput = inputs.nixpkgs;
      };
    };
        # Custom packages; acessible via 'nix build', 'nix shell', etc
    packages = libx.forAllSystems (
      system:
        let
          pkgs = unstable.legacyPackages.${system};
        in
          import ./pkgs { inherit pkgs; }
    );

    # Custom overlays
    overlays = import ./overlays { inherit inputs; };

    # Devshell for bootstrapping
    devShells = libx.forAllSystems (
      system:
      let
        pkgs = unstable.legacyPackages.${system};
      in
      import ./shell.nix { inherit pkgs; }
    );
  };
}

