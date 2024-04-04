{
  description = "An empty flake template for new development flakes";

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
        # flake packages
      ];

      shellHook = ''
        function setup {
            # Code to run when the flake starts
            echo "Entered flake!"
        }
        function cleanup {
            # Code to run when the flake ends
            echo "Exited flake!"
        }
        trap cleanup EXIT
        setup
      '';
    };
  };
}
