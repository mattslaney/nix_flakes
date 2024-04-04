{
  description = "An nodejs deelopment flake";

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
        nodejs_21
        typescript
      ];

      shellHook = ''
        function setup {
            # Code to run when the flake starts
            echo "Entered flake!"
            ln -sf $(pwd)/.flake/nvim/init.lua ~/.config/nvim/lua/flake/init.lua
            ln -sf $(pwd)/.flake/nvim/plugins.lua ~/.config/nvim/lua/flake/plugins.lua
        }
        function cleanup {
            # Code to run when the flake ends
            echo "Exited flake!"
            rm -rf ~/.config/nvim/lua/flake/*
        }
        trap cleanup EXIT
        setup
      '';
    };
  };
}
