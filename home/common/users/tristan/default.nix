{ inputs, ... }:
{
  imports = [
    inputs.sops-nix.homeManagerModules.sops
    ../../dev
#    ../../emacs.nix
    ./ssh-connections.nix
    ./sops.nix
  ];
#  home.file.".config/sops/age/keys.txt" = {
#    source = .config/sops/age/keys.txt;
#  };

}
