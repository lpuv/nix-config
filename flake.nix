{
  description = "Leo's nixos config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hardware.url = "github:nixos/nixos-hardware";
    nur.url = "github:nix-community/NUR";
    nix-alien.url = "github:thiagokokada/nix-alien";
    nix-ld.url = "github:Mic92/nix-ld/main";
    sops-nix.url = "github:Mic92/sops-nix";
    utils.url = "github:numtide/flake-utils";
    emacs-overlay.url = "github:nix-community/emacs-overlay/e9c4d10bbb4e810cbfe5e31248fe835e08efb35a";
    hackpkgs = {
      url = "github:applePrincess/hackpkgs";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "utils";
    };

    # Home manager
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-gaming.url = github:fufexan/nix-gaming;

    # Shameless plug: looking for a way to nixify your themes and make
    # everything match nicely? Try nix-colors!
    # nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { self, nixpkgs, home-manager, nur, sops-nix, utils, hackpkgs, nix-alien, ...
    }@inputs: rec {
      # This instantiates nixpkgs for each system listed
      # Allowing you to configure it (e.g. allowUnfree)
      # Our configurations will use these instances
      legacyPackages = nixpkgs.lib.genAttrs [ "x86_64-linux" "x86_64-darwin" ]
        (system:
          import inputs.nixpkgs {
            inherit system;

            overlays = [
              (self: super: {
                discord = super.discord.override { withOpenASAR = true; };
              })
              (self: super: {
                wpa_supplicant = super.wpa_supplicant.overrideAttrs
                  (oldAttrs: rec {
                    patches = (oldAttrs.patches or [ ])
                      ++ [ ./wpa_lower_security.patch ];
                  });
              })
              (self: super: {
                latte-dock = super.latte-dock.overrideAttrs (oldAttrs: rec {
                  src = super.fetchFromGitLab {
                    domain = "invent.kde.org";
                    owner = "plasma";
                    repo = "latte-dock";
                    rev = "d170d540b45fe04c7b28c1edc5c2a28757959815";
                    sha256 = "5atRBOpG0wPEubk36tXENgj+1F6p9y5c9pOzqYOc2uQ=";
                  };
                });
              })
            ];

            # NOTE: Using `nixpkgs.config` in your NixOS config won't work
            # Instead, you should set nixpkgs configs here
            # (https://nixos.org/manual/nixpkgs/stable/#idm140737322551056)
            config.allowUnfree = true;
            config.allowUnfreePredicate = (pkg: true);
            config.android_sdk.accept_license = true;
          });

      nixosConfigurations = {
        cattop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; }; # Pass flake inputs to our config
          # > Our main nixos configuration file <
          modules = [
            nur.nixosModules.nur
            ./nixos/configuration.nix
            sops-nix.nixosModules.sops
          ];
        };
        overlays.default = import ./packages;
      };

      homeConfigurations = {
        "leo@cattop" = home-manager.lib.homeManagerConfiguration {
          pkgs = legacyPackages.x86_64-linux;
          extraSpecialArgs = {
            inherit inputs;
          }; # Pass flake inputs to our config
          # > Our main home-manager configuration file <
          modules = [ nur.nixosModules.nur ./home-manager/home.nix ];
        };
      };
    };
}
