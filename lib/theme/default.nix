{
  pkgs,
  hostname ? "",
  ...
}:
let
  inherit ((import ./colours.nix)) colours;
  libx = import ./lib.nix { inherit (pkgs) lib; };
in
rec {
  inherit (libx) hexToRgb;
  inherit colours;

  catppuccin = {
    flavor = "latte";
    accent = "green";
    size = "standard";
  };

  gtkTheme = {
    name = "catppuccin-latte-green-standard";
    package = pkgs.catppuccin-gtk.override {
      inherit (catppuccin) size;
      variant = catppuccin.flavor;
      accents = [ catppuccin.accent ];
    };
  };

  qtTheme = {
    name = "Catppuccin-Latte-Green";
    package = pkgs.catppuccin-kvantum.override {
      variant = "Latte";
      accent = "Green";
    };
  };

  iconTheme = rec {
    name = "Papirus-Dark";
    package = pkgs.papirus-icon-theme;
    iconPath = "${package}/share/icons/${name}";
  };

  cursorTheme = {
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
    size = 24;
  };

  fonts = {
    default = {
      name = "Inter";
      package = pkgs.inter;
      size = "11";
    };
    iconFont = {
      name = "Inter";
      package = pkgs.inter;
    };
    monospace = {
      name = "JetBrainsMono Nerd Font";
      package = pkgs.nerd-fonts.jetbrains-mono; #.override { fonts = [ "Meslo" ]; };
    };
    emoji = {
      name = "Joypixels";
      package = pkgs.joypixels;
    };
  };
}
