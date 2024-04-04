{
  description = "My Flake Templates";

  outputs = { self }: {
    templates = {
        empty = {
            path = ./empty;
            description = "An empty nix flake";
        };
        rust = {
            path = ./rust;
            description = "A rust nix flake";
        };
        node = {
            path = ./node;
            description = "A node nix flake";
        };
    };
  };
}
