{ pkgs, ... }:
{
  home.packages = with pkgs; [
#    ijq

    # Rust tooling
    cargo
#    rust-analyzer
    rustfmt
    rustc
    sbctl

    gnumake
    gcc

#    nodejs
#   nodePackages_latest.prettier

#   spread

    # Container tooling
#   dive
#   kubectl
#   skopeo

    # Go tooling
#   go
#   go-tools
#   gofumpt
#   gopls

    # Nix tooling
    devenv
    deadnix
    nil
    nix-init
#    nixfmt #-plus
    nixfmt
    nurl
    statix

    # Python tooling
#   ruff
#   uv
#   (pkgs.python3.withPackages (
#     p: with p; [
#       tox
#       virtualenv
#     ]
#   ))

    # Shell tooling
    shellcheck
    shfmt
  ];
}
