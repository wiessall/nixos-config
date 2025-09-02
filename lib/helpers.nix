{
  self,
  inputs,
  outputs,
  stateVersion,
  username,
  ...
}:
{
  # Helper function for generating home-manager configs
  mkHome =
    {
      hostname,
      user ? username,
      desktop ? null,
      system ? "x86_64-linux",
    }:
    inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = inputs.nixpkgs.legacyPackages.${system};
      extraSpecialArgs = {
        inherit
          self
          inputs
          outputs
          stateVersion
          hostname
          desktop
          ;
        username = user;
      };
      modules = [
	inputs.plasma-manager.homeManagerModules.plasma-manager
	inputs.catppuccin.homeManagerModules.catppuccin
        inputs.sops-nix.homeManagerModules.sops
	../home
      ];
    };

  # Helper function for generating host configs
  mkHost =
    {
      hostname,
      desktop ? null,
      pkgsInput ? inputs.unstable,
    }:
    pkgsInput.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit
          self
          inputs
          outputs
          stateVersion
          username
          hostname
          desktop
          ;
      };
      modules = [
	inputs.lanzaboote.nixosModules.lanzaboote
	inputs.sops-nix.nixosModules.sops
	inputs.impermanence.nixosModules.impermanence
	inputs.flatpaks.nixosModule
        ../host
      ];
    };

  parseFile = { path }: 
  let
    content = builtins.readFile path;
  in
    builtins.fromJSON (builtins.toJSON (builtins.importJSON content));

  forAllSystems = inputs.nixpkgs.lib.genAttrs [
    "aarch64-linux"
    "i686-linux"
    "x86_64-linux"
    "aarch64-darwin"
    "x86_64-darwin"
  ];
}

