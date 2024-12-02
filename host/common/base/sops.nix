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
      keyFile = "/var/lib/sops-nix/key.txt";
      generateKey = true;
    };

    secrets = {
      tristan_passwd = {
#        path = "/run/secrets/example.yaml";
	neededForUsers = false;
      };
    };
  };
}
