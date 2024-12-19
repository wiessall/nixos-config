{ inputs, pkgs, config, ...}:
{
  programs = {
    vscode = {
      enable = true;
      package = pkgs.vscodium;
      extensions = with pkgs.vscode-marketplace ; [
        aaron-bond.better-comments
        bierner.docs-view
        bierner.markdown-preview-github-styles
        codezombiech.gitignore
        donjayamanne.git-extension-pack
        donjayamanne.githistory
        donjayamanne.python-environment-manager
        donjayamanne.python-extension-pack
        harryhopkinson.vs-code-runner
        kevinrose.vsc-python-indent
        ktnrg45.vscode-cython
        mechatroner.rainbow-csv
        ms-python.black-formatter
        ms-python.debugpy
        ms-python.isort
        ms-python.mypy-type-checker
        ms-python.pylint
        ms-python.python
        ms-python.vscode-pylance
        ms-toolsai.datawrangler
        ms-toolsai.jupyter
        ms-toolsai.jupyter-keymap
        ms-toolsai.jupyter-renderers
        ms-toolsai.vscode-jupyter-cell-tags
        ms-toolsai.vscode-jupyter-slideshow
        ms-vscode-remote.vscode-remote-extensionpack
        njpwerner.autodocstring
        rdebugger.r-debugger
        reditorsupport.r
        snakemake.snakemake-lang
        tamasfe.even-better-toml
        tfehlmann.snakefmt
        tootone.org-mode
        vscodevim.vim 
      ];
    };
    emacs = {
      enable = true;
      package = pkgs.emacs30-pgtk;
    };
  };
  home = {
    file = {
      ".spacemacs" = {
        source = config.lib.file.mkOutOfStoreSymlink "/home/tristan/Documents/dotfiles/spacemacs";
      };
      ".spacemacs.env" = {
        source = config.lib.file.mkOutOfStoreSymlink "/home/tristan/Documents/dotfiles/spacemacs.env";
      };
    };
    packages = with pkgs; [
      conda
    ];
  };
}
