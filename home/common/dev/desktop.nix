{ pkgs, ...}:
{
  programs.vscode = {
    enable = true;
  };
  extensions = [
   vim 
  ];

}
