{ pkgs, config, ... }:
{
  programs.ssh = {
    enable = true;
    matchBlocks = {
      # To add new ssh connection 1) generate key & upload 2) add secrets to sops & push 
      # 3) read secrets out in the home sops and host sops 4) nix flake update
      # 5) rebuild switch 6) home-manager switch 7) *only then* add new match blocks here 
      # 8) home-manager switch It's a hacky way to make sure secrets are present to be read 
      # by readFile below
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
      "github" = {
        hostname = builtins.readFile config.sops.secrets."connections/github/hostname".path;
        user = builtins.readFile config.sops.secrets."connections/github/user".path;
        identityFile = "/home/tristan/.ssh/id_ed25519";
        forwardAgent = true;
        port = 22;
      };
      "emblhpc" = {
        hostname = builtins.readFile config.sops.secrets."connections/emblhpc/hostname".path;
        user = builtins.readFile config.sops.secrets."connections/emblhpc/user".path;
        identityFile = "/home/tristan/.ssh/embl_hpc";
        forwardAgent = true;
        port = 22;
      };
      "asari-DB" = {
        hostname = builtins.readFile config.sops.secrets."connections/asari-DB/hostname".path;
        user = builtins.readFile config.sops.secrets."connections/asari-DB/user".path;
        identityFile = "/home/tristan/.ssh/embl_hpc";
        forwardAgent = true;
        port = 22;
      };
      "sti-portal" = {
        hostname = builtins.readFile config.sops.secrets."connections/sti-portal/hostname".path;
        user = builtins.readFile config.sops.secrets."connections/sti-portal/user".path;
        identityFile = "/home/tristan/.ssh/sti_portal";
        forwardAgent = true;
        port = 22;
      };
    };
  };

  # See: https://github.com/nix-community/home-manager/issues/322#issuecomment-1856128020 
  # See: https://github.com/nix-community/home-manager/pull/7074
  # See: https://github.com/nix-community/home-manager/issues/3090
  home.file.".ssh/config" = {
    target = ".ssh/config_source";
    onChange = ''cat ~/.ssh/config_source > ~/.ssh/config && chmod 400 ~/.ssh/config'';
  };
}
