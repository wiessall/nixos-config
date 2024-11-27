let
  sshSecrets = builtins.fromJSON (buitlins.readFile "/run/secrets/example.yaml"
in {
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "my-server" = {
        hostname = sshSecrets.connections."my-server".hostname;
        user = sshSecrets.connections."my-server".user;

	port = 2222;
      };
    };
  };
}
