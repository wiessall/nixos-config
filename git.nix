{ pkgs, ... }:
{

  home.packages = with pkgs; [ gh ];

  programs = {
    git = {
      enable = true;

      userEmail = "tristan.wiessalla@posteo.de";
      userName = "Tristan Wiessalla";

     aliases = {
        lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
      };

      extraConfig = {
        branch = {
          sort = "-committerdate";
        };
        push = {
          default = "matching";
        };
        pull = {
          rebase = true;
        };
        init = {
          defaultBranch = "main";
        };
        gpg = {
          format = "ssh";
          ssh = {
            defaultKeyCommand = "sh -c 'echo key::$(ssh-add -L | head -n1)'";
            allowedSignersFile = "~/.config/git/allowed_signers";
          };
        };
        commit = {
          gpgSign = true;
        };
        tag = {
          gpgSign = true;
        };
      };
    };
  };
}
