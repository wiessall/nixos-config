{ pkgs, config, ... }:
let
  ifExists = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  users.users.tristan = {
    isNormalUser = true;
    hashedPassword = "$6$/XsnbKU4Era85r6h$mnQe6LQ/LHcCxmbvyXzPv9COONNiBvARl8KvcvzAk0V5jrPHvtrmR2.IthTTT3IHOzsztlg8ytTL3PiUJfmYD.";
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

