{ pkgs, config, ... }:
let
  sshSecrets = config.sops.secrets.connections;
in 
{
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "my-server" = {
        hostname = sshSecrets.connections."my-server".hostname;
        user = sshSecrets.connections."my-server".user;
	identityFile = "/home/user/.ssh/my-server_key";

	port = 2222;
      };
    };
  };
  home.file.".ssh/my-server_key" = {
    text = sshSecrets.connections."my-server".identityFile;
    onChange = ''
      chmod 0600 ~/.ssh/my-server_key
    '';
  };
}
