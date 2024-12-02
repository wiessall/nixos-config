{ inputs, ... } :
{
  system.autoUpgrade = {
    enable = true;
    flake = inputs.self.outPath;
    flags = [
      "--update-input"
      "nixpkgs"
      "-L"
    ];
    dates = "02:00";
    randomizedDelaySec = "45min";
  };
  services = {
    tlp = {
      enable = false;
      settings = {
        START_CHARGE_BAT0=40;
	STOP_CHARGE_BAT0=80;
      };

    };
  };
}
