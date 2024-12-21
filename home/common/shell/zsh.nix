{
  programs = {
    zsh = {
      enable = true;
      dotDir = "./config/zsh";
      enableCompletion = true;
#      autosuggestion.enable = true;
      syntaxHighlighting = {
        enable = true;
        catppuccin.enable = true;
      };
      defaultKeymap = "vicmd";
      history = {
        save = 15000;
        size = 20000;
        append = true;
        extended = true;
        ignoreDups = true;
        ignoreSpace = true;
        share = true;
      };
      shellAliases = {
        ls = "eza -gla --git --time-style=\"+%Y-%m-%d\" --color=automatic";
        tree = "eza --tree";
        cat = "bat";
     };
     initExtra = ''
       bindkey '^R' history-incremental-search-backward
       '';


    };
  };
}
