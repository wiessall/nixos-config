{
pkgs,
inputs,
...
}:
{
#  imports = [ inputs.sops-nix.nixosModules.sops ];

  sops = {
    defaultSopsFile = ../../../secrets/example.yaml;
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
    secrets."connections/my-server/hostname" = {};

    secrets = {
      connections = {
#        path = "/run/secrets/example.yaml";
	sopsFile = ../../../secrets/example.yaml;
      };
    };
  };
}
