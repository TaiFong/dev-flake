{
  description = "iat multi-language dev-flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      systems = [
        "aarch64-darwin"
        "x86_64-darwin"
        "x86_64-linux"
        "aarch64-linux"
      ];

      forAllSystems = nixpkgs.lib.genAttrs systems;

    in {

      devShells = forAllSystems (system:
        let
          pkgs = import nixpkgs {
            inherit system;
          };

        in {

          default = pkgs.mkShell {

            packages = with pkgs; [

            # General CLI Tools
              just
              jq
              yq-go
              ripgrep
              fd
              tree
              wget
              curl
              neovim

              # Rust
              rustc
              cargo
              rustfmt
              clippy
              rust-analyzer

              # C / C++
              gcc
              gdb
              cmake
              pkg-config

              # Python
              python313
              uv
              ruff
              pyright

              # JavaScript / Backend
              #nodejs_24
             # npm

              # Database
              postgresql

            ];


            shellHook = ''
              echo ""
              echo "iat Dev-Flake"
              echo ""

              echo "Rust:"
              rustc --version

              echo ""
              echo "Python:"
              python --version

              echo ""
              echo "Node:"
              node --version

              echo ""
              echo "System:"
              echo ${system}

              echo ""
            '';

          };

        });

    };
}
