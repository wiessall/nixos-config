{ pkgs, inputs, ... }:

{
  imports = [ "${inputs.plasma-manager}/modules" ];


  home.packages = with pkgs; [
    plasma-nm
  ];

  programs.plasma = {
    enable = true;

#    overrideConfig = true;

    #
    # Some high-level settings:
    #
    workspace = {
      clickItemTo = "select";
      lookAndFeel = "org.kde.otto.desktop";
#      cursor.theme = "Bibata-Modern-Ice";
#      iconTheme = "McMojave-circle-dark";
      windowDecorations.library = "Catppuccin";
      windowDecorations.theme = "__aurorae__svg__CatppuccinMocha-Modern";
      wallpaper = ./rolling_hills.jpg;
    };

    hotkeys.commands."launch-konsole" = {
      name = "Launch Konsole";
      key = "Meta+T";
      command = "alacritty";
    };

    panels = [
      # Windows-like panel at the bottom
      {
        location = "bottom";
	floating = true;
	hiding = "dodgewindows";
	lengthMode = "fit";
	height = 64;
        widgets = [
          "org.kde.plasma.kickoff"
          "org.kde.plasma.icontasks"
                 ];
      }
      # Global menu at the top
      {
        location = "top";
        height = 26;
	floating = true;
        widgets = [ 
          "org.kde.plasma.appmenu"
          "org.kde.plasma.panelspacer"
	  {
            name = "org.kde.plasma.digitalclock";
	    config = {
	      Appearance = {
	        showDate = true;
	        customDateFormat = "dd MMM";
		showWeekNumbers = true;
		dateDisplayFormat = 1;
	      };
	    };
	  }
          "org.kde.plasma.panelspacer"
          "org.kde.plasma.systemtray"
        ];
      }
    ];

    #
    # Some mid-level settings:
    #
    shortcuts = {
#      kmix = {
#        "decrease_microphone_volume" = "Microphone Volume Down";
#        "decrease_volume" = "Volume Down";
#        "decrease_volume_small" = "Shift+Volume Down";
#        "increase_microphone_volume" = "Microphone Volume Up";
#        "increase_volume" = "Volume Up";
#        "increase_volume_small" = "Shift+Volume Up";
#        "mic_mute" = ["Microphone Mute" "Meta+Volume Mute,Microphone Mute" "Meta+Volume Mute,Mute Microphone"];
#        "mute" = "Volume Mute";
#      };

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

#      "KDE Keyboard Layout Switcher"."Switch to Last-Used Keyboard Layout" = "Meta+Alt+L";
#      "KDE Keyboard Layout Switcher"."Switch to Next Keyboard Layout" = "Meta+Alt+K";

      kwin = {
        "Activate Window Demanding Attention" = "Meta+Ctrl+A";
        "Cycle Overview" = [ ];
        "Cycle Overview Opposite" = [ ];
        "Expose" = "Meta+\\";
        "ExposeClass" = "Ctrl+F7";
        "Grid View" = "Meta+G";
        "Kill Window" = "Meta+Ctrl+Esc";
        "Show Desktop" = "Meta+D";
        "Switch One Desktop Down" = "Meta+Ctrl+Down";
        "Switch One Desktop Up" = "Meta+Ctrl+Up";
        "Switch One Desktop to the Left" = "Meta+Ctrl+Left";
        "Switch One Desktop to the Right" = "Meta+Ctrl+Right";
        "Switch Window Down" = "Meta+J";
        "Switch Window Left" = "Meta+H";
        "Switch Window Right" = "Meta+L";
        "Switch Window Up" = "Meta+K";
        "Switch to Desktop 1" = "Ctrl+F1";
         "Switch to Desktop 2" = "Ctrl+F2";
        "Switch to Desktop 3" = "Ctrl+F3";
        "Switch to Desktop 4" = "Ctrl+F4";
        "Switch to Screen Above" = "none";
        "Switch to Screen Below" = "none";
        "Switch to Screen to the Left" = "none";
        "Switch to Screen to the Right" = "none";
        "Walk Through Windows" = "Meta+Tab";
        "Walk Through Windows (Reverse)" = "Meta+Shift+Tab";
        "Walk Through Windows of Current Application" = "Ctrl+Tab";
        "Walk Through Windows of Current Application (Reverse)" = "Shift+Ctrl+Tab";
        "Window Close" = "Meta+W";
        "Window Fullscreen" = "Meta+Up";
        "Window Minimize" = "Meta+Down";
        "Window One Desktop Down" = "Meta+Ctrl+Shift+Down";
        "Window One Desktop Up" = "Meta+Ctrl+Shift+Up";
        "Window One Desktop to the Left" = "Meta+Ctrl+Shift+Left";
        "Window One Desktop to the Right" = "Meta+Ctrl+Shift+Right";
        "Window Operations Menu" = "Alt+F3";
        "Window Quick Tile Bottom" = "Meta+Down";
        "Window Quick Tile Left" = "Meta+Left";
        "Window Quick Tile Right" = "Meta+Right";
        "Window to Next Screen" = "Meta+Shift+Right";
        "Window to Previous Screen" = "Meta+Shift+Left";
        "view_actual_size" = "Meta+0";
        "view_zoom_in" = ["Meta++" "Meta+=,Meta++" "Meta+=,Zoom In"];
	"view_zoom_out" = "Meta+-";
      };

      mediacontrol = {
        "mediavolumedown" = "volume down";
        "mediavolumeup" = "volume up";
        "nextmedia" = "Media Next";
        "pausemedia" = "Media Pause";
        "playmedia" = "media playback";
        "playpausemedia" = "Media Play";
        "previousmedia" = "Media Previous";
        "stopmedia" = "Media Stop";
      };

      org_kde_powerdevil = {
  "Decrease Keyboard Brightness" = "Keyboard Brightness Down";
        "Decrease Screen Brightness" = "Monitor Brightness Down";
        "Decrease Screen Brightness Small" = "Shift+Monitor Brightness Down";
        "Hibernate" = "Hibernate";
        "Increase Keyboard Brightness" = "Keyboard Brightness Up";
        "Increase Screen Brightness" = "Monitor Brightness Up";
        "Increase Screen Brightness Small" = "Shift+Monitor Brightness Up";
        "PowerDown" = "Power Down";
        "PowerOff" = "Power Off";
        "Sleep" = "Sleep";
        "Toggle Keyboard Backlight" = "Keyboard Light On/Off";
        "Turn Off Screen" = [ ];
        "powerProfile" = ["Battery" "Meta+B,Battery" "Meta+B,Switch Power Profile"];
      };

      plasmashell = {
        "activate task manager entry 1" = "Meta+1";
        "activate task manager entry 10" = "none,Meta+0,Activate Task Manager Entry 10";
        "activate task manager entry 2" = "Meta+2";
        "activate task manager entry 3" = "Meta+3";
        "activate task manager entry 4" = "Meta+4";
        "activate task manager entry 5" = "Meta+5";
        "activate task manager entry 6" = "Meta+6";
        "activate task manager entry 7" = "Meta+7";
        "activate task manager entry 8" = "Meta+8";
        "activate task manager entry 9" = "Meta+9";
        "clear-history" = "none,,Clear Clipboard History";
        "clipboard_action" = "Meta+Ctrl+X";
        "cycle-panels" = "Meta+Alt+P";
        "cycleNextAction" = "none,,Next History Item";
        "cyclePrevAction" = "none,,Previous History Item";
        "manage activities" = "Meta+Q";
        "next activity" = "Meta+A,none,Walk through activities";
        "previous activity" = "Meta+Shift+A,none,Walk through activities (Reverse)";
        "repeat_action" = "none,Meta+Ctrl+R,Manually Invoke Action on Current Clipboard";
        "show dashboard" = "Ctrl+F12";
        "show-barcode" = "none,,Show Barcode…";
        "show-on-mouse-pos" = "Meta+V";
        "stop current activity" = "Meta+S";
        "switch to next activity" = "none,,Switch to Next Activity";
        "switch to previous activity" = "none,,Switch to Previous Activity";
        "toggle do not disturb" = "none,,Toggle do not disturb";
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
