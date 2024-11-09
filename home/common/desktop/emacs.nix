{ pkgs, inputs, desktop, config, ... }:
{
  programs = {
    emacs = {
      enable = true;
      package = pkgs.emacs30-pgtk;
         };
    };
  home.file = {
    ".emacs.d" = {
      source = builtins.fetchGit{
        url = "https://github.com/syl20bnr/spacemacs";
	ref = "develop";
      };
    };
#    ".spacemacs" = {
#      source = config.lib.file.mkOutOfStoreSymlink "/home/tristan/.config/Emacs/spacemacs";
#    };
#    ".spacemacs.env" = {
#      source = config.lib.file.mkOutOfStoreSymlink "/home/tristan/.config/Emacs/spacemacs.env";
#    };
#    "Personal-Layers" = {
#      target = ".config/emacs/private";
#      source = ./Personal-Layers;
#      recursive = true;
#    };
  };
}
