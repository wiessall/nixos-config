{ pkgs, inputs, desktop, config, ... }:
{
  programs = {
    emacs = {
      enable = true;
      package = pkgs.emacs30-pgtk;
         };
    };
  let
    spacemacsRepo = builtins.fetchGit{
        url = "https://github.com/syl20bnr/spacemacs";
	ref = "develop";
      };
  in
  {
  home = {
    activation.spacemacsPermissions = lib.hm.dag.entryAfter ["writeBoundary"] ''
    chmod -R U+rwX,g+rX,o+rX ${spacemacsRepo}
    '';
  file = {
    ".emacs.d" = {
      source =     };
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
  };
 }
}
