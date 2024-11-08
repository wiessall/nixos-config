{ inputs, pkgs, ...}:
{
  programs.vscode = {
    enable = true;
    extensions = with inputs.vscode-extensions.extensions.x86_64-linux.vscode-marketplace ; [
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
      ms-vscode-remote.remote-server
      ms-vscode-remote.remote-explorer
      njpwerner.autodocstring
      rdebgger.r-debugger
      reditorsupport.r
      snakemake.snakemake-lang
      tamasfe.even-better-toml
      tfehlmann.snakefmt
      tootone.org-mode
      vscodevim.vim 
    ];
  };
}
