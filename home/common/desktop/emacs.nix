{ pkgs, inputs, desktop, ... }:
{
  programs = {
    emacs = {
      enable = true;
      package = pkgs.emacs30-pgtk;
         };
    };
  home.file = {
    ".spacemacs" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/tristan/.config/Emacs/spacemacs";
    };
    ".spacemacs.env" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/tristan/.config/Emacs/spacemacs.env";
    };
    "Personal-Layers" = {
      target = ".config/emacs/private";
      source = ./Personal-Layers;
      recursive = true;
    };
  };
}
