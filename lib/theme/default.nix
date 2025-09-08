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
    flavor = "mocha";
    accent = "green";
    size = "standard";
  };

  gtkTheme = {
    name = "catppuccin-mocha-green-standard";
    package = pkgs.catppuccin-gtk.override {
      inherit (catppuccin) size;
      variant = catppuccin.flavor;
      accents = [ catppuccin.accent ];
    };
  };

  qtTheme = {
    name = "Catppuccin-Mocha-Green";
    package = pkgs.catppuccin-kvantum.override {
      variant = "Mocha";
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
