{ inputs, ... }:
{
  imports = [
    ./ssh-connections.nix
  ];
#  home.file.".config/sops/age/keys.txt" = {
#    source = .config/sops/age/keys.txt;
#  };

}
