{
pkgs,
inputs,
...
}:
let
  secretspath = builtins.toString inputs.nix-secrets;
in
builtins.trace "Evaluated secretspath: ${secretspath}" {
  imports = [ inputs.sops-nix.nixosModules.sops ];

  sops = {
    defaultSopsFile = "${secretspath}/secrets.yaml";
    validateSopsFiles = false;

    age = {
      # automatically import host ssh key
      sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
      keyFile = "/home/tristan/.config/sops/age/keys.txt";
      generateKey = true;
    };

    secrets = {
      tristan_passwd = {
#        path = "/run/secrets/example.yaml";
	neededForUsers = true;
      };
      "connections/netcup/hostname" = {};
      "connections/netcup/user" = {};
 
      "connections/embl-hpc/hostname" = {};
      "connections/embl-hpc/user" = {};

      "connections/embl-gitlab/hostname" = {};
      "connections/embl-gitlab/user" = {};

      "connections/asari-DB/hostname" = {};
      "connections/asari-DB/user" = {};

      "connections/github/hostname" = {};
      "connections/github/user" = {};
    };
  };
}
