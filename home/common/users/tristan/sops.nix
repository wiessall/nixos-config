{ inputs, ... }:
let
  secretspath = builtins.toString inputs.nix-secrets;
in
{
  sops = {
    age.keyFile = "/home/tristan/.config/sops/age/keys.txt"; # must have no password!
    # It's also possible to use a ssh key, but only when it has no password:
    #age.sshKeyPaths = [ "/home/user/path-to-ssh-key" ];
    defaultSopsFile = "${secretspath}/secrets.yaml";
    validateSopsFiles = false;

    secrets = {
      "connections/netcup/hostname" = {};
      "connections/netcup/user" = {};

      "connections/emblhpc/hostname" = {};
      "connections/emblhpc/user" = {};

      "connections/emblgitlab/hostname" = {};
      "connections/emblgitlab/user" = {};

      "connections/asari-DB/hostname" = {};
      "connections/asari-DB/user" = {};

      "connections/github/hostname" = {};
      "connections/github/user" = {};

    };
  };
}
