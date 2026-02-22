{
  description = "NixOS config by murfixtap";

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
      user = "murfixtap";
      stateVersion = "25.11";
    in
    {
      nixosConfigurations = {
        luna = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs user stateVersion;
            hostname = "luna";
          };
          modules = [
            ./hosts/luna/default.nix

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useUserPackages = true;
                extraSpecialArgs = {
                  inherit inputs user stateVersion;
                  hostname = "luna";
                };
                users.${user} = import ./home-manager/users/murfixtap/default.nix;
                backupFileExtension = "backup";
              };
            }
          ];
        };
      };
    };
}
