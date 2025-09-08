{ desktop, lib, ...}: {
  # Currently only imported for user 'tristan'
  imports = [
    ./base.nix
  ] ++ lib.optional (builtins.isString desktop) ./desktop.nix;
}
