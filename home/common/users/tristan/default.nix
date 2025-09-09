{ inputs, pkgs, ... }:
{
  imports = [
    inputs.sops-nix.homeManagerModules.sops
    ../../dev
#    ../../emacs.nix
    ../../desktop/firefox.nix
    ./ssh-connections.nix
    ./sops.nix
  ];
#  home.file.".config/sops/age/keys.txt" = {
#    source = .config/sops/age/keys.txt;
#  };
  home.packages = with pkgs; [
    goldwarden
    nextcloud-client
    signal-desktop
  ];

  programs.plasma.configFile = { "kxkbrc"."Layout"."Options" = "caps:swapescape"; };

}
