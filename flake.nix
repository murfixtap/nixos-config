{
  description = "NixOS config by murfixtap";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    stylix,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    user = "murfixtap";
    stateVersion = "25.11";
    flakePath = "/home/${user}/nixos-config";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      luna = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs user stateVersion flakePath;
          hostname = "luna";
        };
        modules = [
          ./hosts/luna/default.nix
          home-manager.nixosModules.home-manager
          stylix.nixosModules.stylix
          {
            home-manager = {
              useUserPackages = true;
              extraSpecialArgs = {
                inherit inputs user stateVersion flakePath;
                hostname = "luna";
              };
              users.${user} = import ./home-manager/users/murfixtap/default.nix;
              backupFileExtension = "backup";
            };
          }
        ];
      };
    };

    homeConfigurations = {
      ${user} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [./home-manager/users/murfixtap/default.nix];
        extraSpecialArgs = {
          inherit inputs user stateVersion flakePath;
          hostname = "luna";
        };
      };
    };
  };
}
