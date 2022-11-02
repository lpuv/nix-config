{
  description = "You new nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hardware.url = "github:nixos/nixos-hardware";
    nur.url = "github:nix-community/NUR";
    sops-nix.url = github:Mic92/sops-nix;

    # Home manager
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    
    # TODO: Add any other flake you might need

    # Shameless plug: looking for a way to nixify your themes and make
    # everything match nicely? Try nix-colors!
    # nix-colors.url = "github:misterio77/nix-colors";
  ***REMOVED***;

  outputs = { self, nixpkgs, home-manager, nur, sops-nix, ... ***REMOVED***@inputs: rec {
    # This instantiates nixpkgs for each system listed
    # Allowing you to configure it (e.g. allowUnfree)
    # Our configurations will use these instances
    legacyPackages = nixpkgs.lib.genAttrs [ "x86_64-linux" "x86_64-darwin" ] (system:
      import inputs.nixpkgs {
        inherit system;
        nixpkgs.overlays =
          let
            discordOverlay = self: super: {
              discord = super.discord.override { withOpenASAR = true; ***REMOVED***;
            ***REMOVED***;
          in
          [ discordOverlay ];

        overlays = [
          (self: super: {
            wpa_supplicant = super.wpa_supplicant.overrideAttrs (oldAttrs: rec {
              patches = (oldAttrs.patches or []) ++ [
                /home/leo/nix-config/patches/wpa_lower_security.patch
              ];
            ***REMOVED***);
          ***REMOVED***)
        ];

        # NOTE: Using `nixpkgs.config` in your NixOS config won't work
        # Instead, you should set nixpkgs configs here
        # (https://nixos.org/manual/nixpkgs/stable/#idm140737322551056)
        config.allowUnfree = true;
        config.allowUnfreePredicate = (pkg: true);
      ***REMOVED***
    );

    nixosConfigurations = {
      # FIXME replace with your hostname
      cattop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        pkgs = legacyPackages.x86_64-linux;
        specialArgs = { inherit inputs; ***REMOVED***; # Pass flake inputs to our config
        # > Our main nixos configuration file <
        modules = [ 
        nur.nixosModules.nur 
        ./nixos/configuration.nix 
        sops-nix.nixosModules.sops ];
      ***REMOVED***;
    ***REMOVED***;

    homeConfigurations = {
      # FIXME replace with your username@hostname
      "leo@cattop" = home-manager.lib.homeManagerConfiguration {
        system = "x86_64-linux";
        pkgs = legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs; ***REMOVED***; # Pass flake inputs to our config
        # > Our main home-manager configuration file <
        modules = [ nur.nixosModules.nur ./home-manager/home.nix ];
      ***REMOVED***;
    ***REMOVED***;
  ***REMOVED***;
***REMOVED***
