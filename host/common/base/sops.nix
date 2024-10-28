{
pkgs,
inputs,
...
}:
{
  imports = [ inputs.sops-nix.nixosModules.sops ];

  sops = {
    defaultSopsFile = secrets/example.yaml;
    validateSopsFiles = false;

    age = {
      # automatically import host ssh key
      sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519.key" ];
      keyFile = "/var/lib/sops-nix/key.txt";
      generateKey = true;
    };

  };
  secrets = {
    example-key = {};
    "myservice/my_subdir/my_secret" = {};
  };

}
