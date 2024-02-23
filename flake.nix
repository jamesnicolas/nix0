{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
          modules = [ 
            ./configuration.nix
            home-manager.nixosModules.home-manager
          ];
        };
      home-manager.users.nicolas9 = {
        /* The home.stateVersion option does not have a default and must be set */
        home.stateVersion = "23.11";
        /* Here goes the rest of your home-manager config, e.g. home.packages = [ pkgs.foo ]; */
      };
    };
}
