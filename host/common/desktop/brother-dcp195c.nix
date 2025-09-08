{ stdenv
, fetchurl
, dpkg
, patchelf
, pkgsi686Linux   # gives us 32-bit glibc for the Brother binary
, bash, gnused, coreutils
}:

let
  glibc32 = pkgsi686Linux.stdenv.cc.libc;  # provides .../lib/ld-linux.so.2
in
stdenv.mkDerivation rec {
  pname = "cups-brother-dcp195c";
  version = "1.1.3-1";

  srcs = [
    (fetchurl {
      url = "https://download.brother.com/welcome/dlf005399/dcp195clpr-1.1.3-1.i386.deb";
      # your SRI is fine; you can also use `hash = ...`
      sha256 = "sha256-Nr2iiddI/uWpLCadsdFSyK3IEfvUVwbzhxyJFPFPm5I=";
    })
    (fetchurl {
      url = "https://download.brother.com/welcome/dlf005401/dcp195ccupswrapper-1.1.3-1.i386.deb";
      sha256 = "sha256-7StkJr023PmvsKS4uw7rYdEcFfknDNbjDXyFEC5FjH8=";
    })
  ];

  nativeBuildInputs = [ dpkg patchelf ];
  buildInputs = [ bash gnused coreutils ];

  unpackPhase = ''
    for f in $srcs; do
      dpkg-deb -x "$f" $TMPDIR/unpacked
    done
  '';

  installPhase = ''
    mkdir -p $out
    cp -R $TMPDIR/unpacked/* $out/

    BRODIR=$out/opt/brother/Printers/dcp195c
    WRAPDIR="$BRODIR/cupswrapper"
    BIN="$BRODIR/lpd/filterdcp195c"

    # Patch the 32-bit binary filter so it runs on NixOS
    if [ -f "$BIN" ]; then
      chmod +x "$BIN"
      patchelf \
        --set-interpreter ${glibc32.out}/lib/ld-linux.so.2 \
        --set-rpath ${glibc32.out}/lib:${glibc32.lib}/lib \
        "$BIN"
    fi

    # Expose PPD + filters to CUPS
    mkdir -p $out/share/cups/model $out/lib/cups/filter

    # PPD
    if [ -f "$WRAPDIR/brother_dcp195c_printer_en.ppd" ]; then
      ln -s "$WRAPDIR/brother_dcp195c_printer_en.ppd" \
            $out/share/cups/model/brother_dcp195c.ppd
    fi

    # CUPSwrapper script (critical) → install with BOTH names
    for f in brlpdwrapperDCP195C cupswrapperdcp195c; do
      if [ -f "$WRAPDIR/$f" ]; then
        chmod +x "$WRAPDIR/$f"
        patchShebangs "$WRAPDIR/$f"
        ln -s "$WRAPDIR/$f" $out/lib/cups/filter/brlpdwrapperDCP195C
        ln -s "$WRAPDIR/$f" $out/lib/cups/filter/brlpdwrapperdcp195c  # lowercase alias (your log wanted this)
        break
      fi
    done
  '';

  meta = {
#    description = "Brother DCP-195C CUPS driver (LPR + CUPSwrapper, patched for NixOS)";
#    license = stdenv.lib.licenses.unfreeRedistributable;
#    platforms = stdenv.lib.platforms.linux;
  };
}

