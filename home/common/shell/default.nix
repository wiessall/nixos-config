{ pkgs, self, ... }:
let
  theme = import "${self}/lib/theme" { inherit pkgs; };
in
{
  imports = [
    ./bat.nix
    ./git.nix
    ./starship.nix
    ./tmux.nix
    ./vim.nix
    ./zsh.nix
  ];

  catppuccin = {
    enable = true;
    inherit (theme.catppuccin) flavor;
    inherit (theme.catppuccin) accent;
    tmux = {
      enable = true;
    };
    bat = {
      enable = true;
    };
    alacritty = {
      enable = true;
    };
    zsh-syntax-highlighting = {
      enable = true;
    };
  };

  programs = {
    eza.enable = true;
    git.enable = true;
    gpg.enable = true;
    home-manager.enable = true;
#    jq.enable = true;
  };

  services = {
    gpg-agent = {
      enable = true;
      pinentry.package = pkgs.pinentry-curses;
    };
  };


  home.packages = with pkgs; [
    git-lfs
  ];
}
