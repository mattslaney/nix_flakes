{
  description = "A Basic Flake for Rust Development";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
  };

  outputs = { self, nixpkgs, ... }:
  let
    system = "x86_64-linux";
  in
  {
    devShells."${system}".default = 
    let
      pkgs = import nixpkgs {
        inherit system;
      };
    in pkgs.mkShell {
      packages = with pkgs; [
        cargo
        rustc
        rustfmt
        rust-analyzer
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
