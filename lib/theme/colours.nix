rec {
  colours = rec {
    inherit (catppuccin-mocha)
      pink
      red
      yellow
      green
      ;
    inherit (catppuccin-mocha) subtext0 subtext1 text;
    inherit (catppuccin-mocha) overlay0 overlay1 overlay2;
    inherit (catppuccin-mocha) surface0 surface1 surface2;

    accent = green;
    black = catppuccin-mocha.crust;
    white = catppuccin-mocha.rosewater;
    lightPink = catppuccin-mocha.flamingo;
    lightRed = catppuccin-mocha.maroon;
    orange = catppuccin-mocha.peach;
    cyan = catppuccin-mocha.teal;
    blue = catppuccin-mocha.sapphire;
    darkBlue = catppuccin-mocha.blue;
    lightBlue = catppuccin-mocha.sky;
    purple = catppuccin-mocha.mauve;
    lightPurple = catppuccin-mocha.lavender;
    bg = catppuccin-mocha.base;
    bgDark = catppuccin-mocha.mantle;
  };

  catppuccin-mocha = {
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
