{ pkgs, config, ... }:
{
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "embl-gitlab" = {
        hostname = builtins.readFile config.sops.secrets."connections/embl-gitlab/hostname".path;
        user = builtins.readFile config.sops.secrets."connections/embl-gitlab/user".path;
	identityFile = "/home/tristan/.ssh/embl_gitlab";
	forwardAgent = true;
	port = 22;
      };
      "netcup" = {
        hostname = builtins.readFile config.sops.secrets."connections/netcup/hostname".path;
        user = builtins.readFile config.sops.secrets."connections/netcup/user".path;
	identityFile = "/home/tristan/.ssh/netcup_arch";
	forwardAgent = true;
	port = 22;
      };    
#      "github" = {
#        hostname = builtins.readFile config.sops.secrets."connections/github/hostname".path;
#        user = builtins.readFile config.sops.secrets."connections/github/user".path;
#	identityFile = "/home/tristan/.ssh/id_ed25519";
#	forwardAgent = true;
#	port = 22;
#      };
      "emblhpc" = {
        hostname = builtins.readFile config.sops.secrets."connections/emblhpc/hostname".path;
        user = builtins.readFile config.sops.secrets."connections/emblhpc/user".path;
	identityFile = "/home/tristan/.ssh/embl_hpc";
	forwardAgent = true;
	port = 22;
      };
#      "asari-DB" = {
#        hostname = builtins.readFile config.sops.secrets."connections/asari-DB/hostname".path;
#        user = builtins.readFile config.sops.secrets."connections/asari-DB/user".path;
#	identityFile = "/home/tristan/.ssh/embl_hpc";
#	forwardAgent = true;
#	port = 22;
#      };
    };
  };
  home.file.".ssh/config".onChange = ''chmod 600 ~/.ssh/config'';
#  home.file.".ssh/my-server_key" = {
#    text = sshSecrets.connections."my-server".identityFile;
#    onChange = ''
#      chmod 0600 ~/.ssh/my-server_key
#    '';
#  };
}
