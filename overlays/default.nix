{ inputs, ... }:
{
  # When applied, the unstable nixpkgs set (declared in the flake inputs) will
  # be accessible through 'pkgs.unstable'
  unstable-packages = final: _prev: {
    master = import inputs.master {
      inherit (final) system;
      config.allowUnfree = true;
    };
    unstable = import inputs.unstable {
      inherit (final) system;
      config.allowUnfree = true;
      overlays = [
	inputs.nix-vscode-extensions.overlays.default # Also have a look at https://github.com/nix-community/nix-vscode-extensions/issues/29
        (_final: prev: {
          # example = prev.example.overrideAttrs (oldAttrs: rec {
          # ...
          # });
	          # Override each Plasma-related package individually from unstable
#          plasma-desktop = inputs.unstable.legacyPackages."${prev.system}".plasma-desktop;
#          plasma-workspace = inputs.unstable.legacyPackages."${prev.system}".plasma-workspace;
#          plasma-framework = inputs.unstable.legacyPackages."${prev.system}".plasma-framework;
        })
      ];
    };
  };
}
