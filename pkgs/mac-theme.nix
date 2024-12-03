{ pkgs, ... }: 
{
  mac-theme = pkgs.stdenv.mkDerivation {
    pname = "mac-theme";
    version = "latest";
    src = pkgs.fetchgit {
      url = "https://github.com/vinceliuice/WhiteSur-kde";
      rev = "efba411e11f8f4d3219bffb393d25afae62eacf2";
      hash = "sha256-052mKpf8e5pSecMzaWB3McOZ/uAqp/XGJjcVWnlKPLE=";
    };
    installPhase = ''
      mkdir -p $out/share/plasma
      cp -aR * $out/share/plasma
    '';
  };
}
