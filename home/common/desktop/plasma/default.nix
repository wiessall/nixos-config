{ pkgs, inputs, ... }:

{
  imports = [ "${inputs.plasma-manager}/modules" ];

  programs.plasma = {
    enable = true;
    overrideConfig = true;

    #
    # Some high-level settings:
    #
    workspace = {
      clickItemTo = "select";
      lookAndFeel = "org.kde.otto.desktop";
      cursor.theme = "Bibata-Modern-Ice";
      iconTheme = "McMojave-circle-dark";
      wallpaper = "${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Patak/contents/images/1080x1920.png";
    };

    hotkeys.commands."launch-konsole" = {
      name = "Launch Konsole";
      key = "Meta+T";
      command = "konsole";
    };

    panels = [
      # Windows-like panel at the bottom
      {
        location = "bottom";
	floating = true;
	hiding = "autohide";
	lengthMode = "fit";
	height = 42;
        widgets = [
          "org.kde.plasma.kickoff"
          "org.kde.plasma.icontasks"
                 ];
      }
      # Global menu at the top
      {
        location = "top";
        height = 26;
        widgets = [ 
          "org.kde.plasma.appmenu"
          "org.kde.plasma.panelspacer"
          "org.kde.plasma.digitalclock"
          "org.kde.plasma.panelspacer"
          "org.kde.plasma.systemtray"
        ];
      }
    ];

    #
    # Some mid-level settings:
    #
    shortcuts = {
      ksmserver = {
        "Lock Session" = [
          "Screensaver"
          "Meta+R"
        ];
	"Log Out" = "Ctrl+Alt+Del";
        "Log Out Without Confirmation" = "none,,Log Out Without Confirmation";
        "Reboot" = "none,,Reboot";
        "Reboot Without Confirmation" = "none,,Reboot Without Confirmation";
        "Shut Down" = "none,,Shut Down";
      };

      "KDE Keyboard Layout Switcher"."Switch to Last-Used Keyboard Layout" = "Meta+Alt+L";
      "KDE Keyboard Layout Switcher"."Switch to Next Keyboard Layout" = "Meta+Alt+K";

      kwin = {
        "Activate Window Demanding Attention" = "Meta+Ctrl+A";
        "Cycle Overview" = [ ];
        "Cycle Overview Opposite" = [ ];
        "Decrease Opacity" = "none,,Decrease Opacity of Active Window by 5%";
        "Edit Tiles" = "none,none,Toggle Tiles Editor";
        "Expose" = "Meta+\\,,Ctrl+F9,Toggle Present Windows (Current desktop)";
        "ExposeAll" = ["Ctrl+F10" "Launch (C),Ctrl+F10" "Launch (C),Toggle Present Windows (All desktops)"];
        "ExposeClass" = "Ctrl+F7";
        "ExposeClassCurrentDesktop" = [ ];
        "Grid View" = "Meta+G";
        "Increase Opacity" = "none,,Increase Opacity of Active Window by 5%";
        "Kill Window" = "Meta+Ctrl+Esc"; "Move Tablet to Next Output" = [ ];
        "MoveMouseToCenter" = "Meta+F6";
        "MoveMouseToFocus" = "Meta+F5";
        "MoveZoomDown" = [ ];
        "MoveZoomLeft" = [ ];
        "MoveZoomRight" = [ ];
        "MoveZoomUp" = [ ];
        "Overview" = "none,Meta+W,Toggle Overview";
        "Setup Window Shortcut" = "none,,Setup Window Shortcut";
        "Show Desktop" = "Meta+D";
        "Switch One Desktop Down" = "Meta+Ctrl+Down";
        "Switch One Desktop Up" = "Meta+Ctrl+Up";
        "Switch One Desktop to the Left" = "Meta+Ctrl+Left";
        "Switch One Desktop to the Right" = "Meta+Ctrl+Right";
        "Switch Window Down" = "Meta+J,Meta+Alt+Down,Switch to Window Below";
        "Switch Window Left" = "Meta+H,Meta+Alt+Left,Switch to Window to the Left";
        "Switch Window Right" = "Meta+L,Meta+Alt+Right,Switch to Window to the Right";
        "Switch Window Up" = "Meta+K,Meta+Alt+Up,Switch to Window Above";
        "Switch to Desktop 1" = "Ctrl+F1";
         "Switch to Desktop 2" = "Ctrl+F2";
        "Switch to Desktop 3" = "Ctrl+F3";
        "Switch to Desktop 4" = "Ctrl+F4";
        "Switch to Desktop 5" = "none,,Switch to Desktop 5";
        "Switch to Desktop 6" = "none,,Switch to Desktop 6";
        "Switch to Desktop 7" = "none,,Switch to Desktop 7";
        "Switch to Desktop 8" = "none,,Switch to Desktop 8";
        "Switch to Next Desktop" = "none,,Switch to Next Desktop";
        "Switch to Next Screen" = "none,,Switch to Next Screen";
        "Switch to Previous Desktop" = "none,,Switch to Previous Desktop";
        "Switch to Previous Screen" = "none,,Switch to Previous Screen";
        "Switch to Screen 0" = "none,,Switch to Screen 0";
        "Switch to Screen 1" = "none,,Switch to Screen 1";
        "Switch to Screen 2" = "none,,Switch to Screen 2";
        "Switch to Screen 3" = "none,,Switch to Screen 3";
        "Switch to Screen 4" = "none,,Switch to Screen 4";
        "Switch to Screen Above" = "none,,Switch to Screen Above";
        "Switch to Screen Below" = "none,,Switch to Screen Below";
        "Switch to Screen to the Left" = "none,,Switch to Screen to the Left";
        "Switch to Screen to the Right" = "none,,Switch to Screen to the Right";
        "Toggle Night Color" = [ ];
        "Toggle Window Raise/Lower" = "none,,Toggle Window Raise/Lower";
        "Walk Through Windows" = "Meta+Tab";
        "Walk Through Windows (Reverse)" = "Meta+Shift+Tab";
        "Walk Through Windows Alternative" = "none,,Walk Through Windows Alternative";
        "Walk Through Windows Alternative (Reverse)" = "none,,Walk Through Windows Alternative (Reverse)";
        "Walk Through Windows of Current Application" = "Ctrl+Tab";
        "Walk Through Windows of Current Application (Reverse)" = "Shift+Ctrl+Tab";
        "Walk Through Windows of Current Application Alternative" = "none,,Walk Through Windows of Current Application Alternative";
        "Walk Through Windows of Current Application Alternative (Reverse)" = "none,,Walk Through Windows of Current Application Alternative (Reverse)";
        "Window Above Other Windows" = "none,,Keep Window Above Others";
        "Window Below Other Windows" = "none,,Keep Window Below Others";
        "Window Close" = "Meta+W,Alt+F4,Close Window";
        "Window Fullscreen" = "none,,Make Window Fullscreen";
        "Window Grow Horizontal" = "none,,Expand Window Horizontally";
        "Window Grow Vertical" = "none,,Expand Window Vertically";
        "Window Lower" = "none,,Lower Window";
        "Window Maximize" = "Meta+Up,Meta+PgUp,Maximize Window";
        "Window Maximize Horizontal" = "none,,Maximize Window Horizontally";
        "Window Maximize Vertical" = "none,,Maximize Window Vertically";
        "Window Minimize" = "Meta+Down";
        "Window Move" = "none,,Move Window";
        "Window Move Center" = "none,,Move Window to the Center";
        "Window No Border" = "none,,Toggle Window Titlebar and Frame";
        "Window On All Desktops" = "none,,Keep Window on All Desktops";
        "Window One Desktop Down" = "Meta+Ctrl+Shift+Down";
        "Window One Desktop Up" = "Meta+Ctrl+Shift+Up";
        "Window One Desktop to the Left" = "Meta+Ctrl+Shift+Left";
        "Window One Desktop to the Right" = "Meta+Ctrl+Shift+Right";
        "Window One Screen Down" = "none,,Move Window One Screen Down";
        "Window One Screen Up" = "none,,Move Window One Screen Up";
        "Window One Screen to the Left" = "none,,Move Window One Screen to the Left";
        "Window One Screen to the Right" = "none,,Move Window One Screen to the Right";
        "Window Operations Menu" = "Alt+F3";
        "Window Pack Down" = "none,,Move Window Down";
        "Window Pack Left" = "none,,Move Window Left";
        "Window Pack Right" = "none,,Move Window Right";
        "Window Pack Up" = "none,,Move Window Up";
        "Window Quick Tile Bottom" = "Meta+Down";
        "Window Quick Tile Bottom Left" = "none,,Quick Tile Window to the Bottom Left";
        "Window Quick Tile Bottom Right" = "none,,Quick Tile Window to the Bottom Right";
        "Window Quick Tile Left" = "Meta+Left";
        "Window Quick Tile Right" = "Meta+Right";
        "Window Quick Tile Top" = "none,Meta+Up,Quick Tile Window to the Top";
        "Window Quick Tile Top Left" = "none,,Quick Tile Window to the Top Left";
        "Window Quick Tile Top Right" = "none,,Quick Tile Window to the Top Right";
        "Window Raise" = "none,,Raise Window";
        "Window Resize" = "none,,Resize Window";
        "Window Shade" = "none,,Shade Window";
        "Window Shrink Horizontal" = "none,,Shrink Window Horizontally";
        "Window Shrink Vertical" = "none,,Shrink Window Vertically";
        "Window to Desktop 1" = "none,,Window to Desktop 1";
        "Window to Desktop 10" = "none,,Window to Desktop 10";
        "Window to Desktop 11" = "none,,Window to Desktop 11";
        "Window to Desktop 12" = "none,,Window to Desktop 12";
        "Window to Desktop 13" = "none,,Window to Desktop 13";
        "Window to Desktop 14" = "none,,Window to Desktop 14";
        "Window to Desktop 15" = "none,,Window to Desktop 15";
        "Window to Desktop 16" = "none,,Window to Desktop 16";
        "Window to Desktop 17" = "none,,Window to Desktop 17";
        "Window to Desktop 18" = "none,,Window to Desktop 18";
        "Window to Desktop 19" = "none,,Window to Desktop 19";
        "Window to Desktop 2" = "none,,Window to Desktop 2";
        "Window to Desktop 20" = "none,,Window to Desktop 20";
        "Window to Desktop 3" = "none,,Window to Desktop 3";
        "Window to Desktop 4" = "none,,Window to Desktop 4";
        "Window to Desktop 5" = "none,,Window to Desktop 5";
        "Window to Desktop 6" = "none,,Window to Desktop 6";
        "Window to Desktop 7" = "none,,Window to Desktop 7";
        "Window to Desktop 8" = "none,,Window to Desktop 8";
        "Window to Desktop 9" = "none,,Window to Desktop 9";
        "Window to Next Desktop" = "none,,Window to Next Desktop";
        "Window to Next Screen" = "Meta+Shift+Right";
        "Window to Previous Desktop" = "none,,Window to Previous Desktop";
        "Window to Previous Screen" = "Meta+Shift+Left";
        "Window to Screen 0" = "none,,Move Window to Screen 0";
        "Window to Screen 1" = "none,,Move Window to Screen 1";
        "Window to Screen 2" = "none,,Move Window to Screen 2";
        "Window to Screen 3" = "none,,Move Window to Screen 3";
        "Window to Screen 4" = "none,,Move Window to Screen 4";
        "Window to Screen 5" = "none,,Move Window to Screen 5";
        "Window to Screen 6" = "none,,Move Window to Screen 6";
        "Window to Screen 7" = "none,,Move Window to Screen 7";
        "view_actual_size" = "Meta+0";
        "view_zoom_in" = ["Meta++" "Meta+=,Meta++" "Meta+=,Zoom In"];
        "view_zoom_out" = "Meta+-";
 
      };
    };

    #
    # Some low-level settings:
    #
    configFile = {
      "baloofilerc"."Basic Settings"."Indexing-Enabled" = false;
      "kwinrc"."Xwayland"."Scale" = 1.15;
      "kwinrc"."Tiling"."padding" = 4;
      "kwinrc"."org.kde.kdecoration2"."ButtonsOnLeft" = "SF";
      "kwinrc"."Desktops"."Number" = {
        value = 8;
        # Forces kde to not change this value (even through the settings app).
        immutable = true;
      };

      "kxkbrc"."Layout"."Options" = "caps:swapescape";
      "kxkbrc"."Layout"."ResetOldOptions" = true;
      "plasma-localerc"."Formats"."LANG" = "en_US.UTF-8";
      "spectaclerc"."ImageSave"."translatedScreenshotsFolder" = "Screenshots";
      "spectaclerc"."VideoSave"."translatedScreencastsFolder" = "Screencasts";
    };

  };
}
