{
  config,
  hostname,
  lib,
  self,
  ...
}:
{
  imports = lib.optional (builtins.pathExists (./. + "/${hostname}.nix")) ./${hostname}.nix;

  # See individual host config files for backup/restore instructions.
  services.borgbackup.jobs."vivaldi" = {
    encryption = {
      mode = "repokey-blake2";
      passCommand = "cat ${config.sops.secrets."borg/vivaldi/pw".path}";
    };
    compression = "auto,lz4";
  };
}
