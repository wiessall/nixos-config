rec {
  colours = rec {
    inherit (catppuccin-latte)
      pink
      red
      yellow
      green
      ;
    inherit (catppuccin-latte) subtext0 subtext1 text;
    inherit (catppuccin-latte) overlay0 overlay1 overlay2;
    inherit (catppuccin-latte) surface0 surface1 surface2;

    accent = darkBlue;
    black = catppuccin-latte.crust;
    white = catppuccin-latte.rosewater;
    lightPink = catppuccin-latte.flamingo;
    lightRed = catppuccin-latte.maroon;
    orange = catppuccin-latte.peach;
    cyan = catppuccin-latte.teal;
    blue = catppuccin-latte.sapphire;
    darkBlue = catppuccin-latte.blue;
    lightBlue = catppuccin-latte.sky;
    purple = catppuccin-latte.mauve;
    lightPurple = catppuccin-latte.lavender;
    bg = catppuccin-latte.base;
    bgDark = catppuccin-latte.mantle;
  };

  catppuccin-latte = {
    rosewater = "#dc8a78";
    flamingo = "#dd7878";
    pink = "#ea76cb";
    mauve = "#8839ef";
    red = "#d20f39";
    maroon = "#e64553";
    peach = "#fe640b";
    yellow = "#df8e1d";
    green = "#40a02b";
    teal = "#179299";
    sky = "#04a5e5";
    sapphire = "#1e66f5";
    blue = "#1e66f5";
    lavender = "#7287fd";

    subtext0 = "#6c6f85";
    subtext1 = "#7c7f93";
    text = "#4c4f69";

    overlay0 = "#9ca0ba";
    overlay1 = "#8c8fa1";
    overlay2 = "#7c7f93";

    surface0 = "#ccd0da";
    surface1 = "#bcc0cc";
    surface2 = "#acb0be";

    base = "#eff1f5";
    crust = "#dce0e8";
    mantle = "#e6e9ef";
  };
}
