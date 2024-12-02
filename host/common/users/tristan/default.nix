{ pkgs, inputs, config, ... }:
let
  ifExists = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  users.users.tristan = {
    isNormalUser = true;
    initialHashedPassword = "$y$j9T$Ng15Ehw.K0SjxxizWiJ96.$PdBcn06K/mruQxJKLN0KhNTxBLM5zefUNWsjSRmm7YB";
#    hashedPasswordFile = config.sops.secrets.tristan_passwd.path;
    shell = pkgs.zsh;
    extraGroups =
      [
        "audio"
        "networkmanager"
        "users"
        "video"
        "wheel"
        "vboxsf"
      ]
      ++ ifExists [
        "docker"
        "plugdev"
        "render"
        "lxd"

      ];

    openssh.authorizedKeys.keys = [
    ];

    packages = [ pkgs.home-manager ];
  };

  # This is a workaround for not seemingly being able to set $EDITOR in home-manager
  environment.sessionVariables = {
    EDITOR = "vim";
  };
}

