{
  description = "A Basic Flake for Rust Development";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, ... }:
  let
    system = "x86_64-linux";
    overlay-unstable = final: prev: {
      unstable = import nixpkgs-unstable {
        inherit system;
      };
    };
    unstable-overlay = final: prev: {
      unstable = import nixpkgs-unstable {
        inherit system;
      };
    };
  in
  {
    devShells."${system}".default =
    let
      pkgs = import nixpkgs {
        inherit overlay-unstable system;
        overlays = [ unstable-overlay ];
      };
    in pkgs.mkShell {
      packages = with pkgs; [
        cargo
        unstable.rustc
        rustfmt
        unstable.rust-analyzer
      ];

      shellHook = ''
        function setup {
            echo "Entered flake!"
            ln -sf $(pwd)/.flake/nvim/plugins.lua ~/.config/nvim/lua/flake/plugins.lua
        }
        function cleanup {
            rm -rf ~/.config/nvim/lua/flake/*
            echo "Exited flake!"
        }
        trap cleanup EXIT
        setup
      '';
    };
  };
}

