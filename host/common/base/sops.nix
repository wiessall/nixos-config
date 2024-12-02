{
pkgs,
inputs,
...
}:
let
  secretspath = builtins.toString inputs.nix-secrets;
in
{
  imports = [ inputs.sops-nix.nixosModules.sops ];

  sops = {
    defaultSopsFile = "${secretspath}/secrets.yaml";
    validateSopsFiles = false;

    age = {
      # automatically import host ssh key
      sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519.key" ];
      # Keys used at the top of your .sops.yaml file
      # could be the inital keys set up when followin
      # the sops-nix README
      keyFile = "/var/lib/sops-nix/keys.txt";
      generateKey = true;
    };

    secrets = {
      tristan_passwd = {
#        path = "/run/secrets/example.yaml";
	neededForUsers = true;
      };
    };
  };
}
