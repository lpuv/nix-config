# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... ***REMOVED***:

{

  virtualisation = {
    docker.enable = true;
  ***REMOVED***;

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      <home-manager/nixos>
    ];

  environment.etc = {
    "wpa_supplicant/openssl.cnf" = {
      text = ''
      [openssl_init]
      providers = provider_sect
      ssl_conf = ssl_sect
 
      [ssl_sect]
      system_default = system_default_sect
 
      [system_default_sect]
      Options = UnsafeLegacyRenegotiation
      CipherString = DEFAULT@SECLEVEL=0
      '';
    ***REMOVED***;
    "ssl/openssl.cnf" = {
      text = ''
      [openssl_init]
      providers = provider_sect
      ssl_conf = ssl_sect
 
      [ssl_sect]
      system_default = system_default_sect
 
      [system_default_sect]
      Options = UnsafeLegacyRenegotiation
      CipherString = DEFAULT@SECLEVEL=0
      '';
    ***REMOVED***;
  ***REMOVED***;

  systemd.services.wpa_supplicant.environment = {
    OPENSSL_CONF = "/etc/wpa_supplicant/openssl.cnf";
  ***REMOVED***;

  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    ***REMOVED***;
  ***REMOVED***;

#  boot.kernelPackages = pkgs.linuxPackages_xanmod_latest; 
  boot.kernelPackages = pkgs.linuxPackages_zen;
  #boot.kernelPackages = pkgs.linuxPackagesFor (pkgs.linux_5_19.override {
  #  argsOverride = rec {
  #    src = pkgs.fetchurl {
  #          url = "mirror://kernel/linux/kernel/v5.x/linux-${version***REMOVED***.tar.gz";
  #          sha256 = "f201873920873bcd3c62b4d1bf2091d0ca00ff3c81cb3a1063d38d23058f6062";
  #    ***REMOVED***;
  #    version = "5.19.17";
  #    modDirVersion = "5.19.17";
  #  ***REMOVED***;
  #***REMOVED***);
  boot.supportedFilesystems = [ "btrfs" ];
  hardware.enableAllFirmware = true;
  nixpkgs.config.allowUnfree = true;
  
  # Graphics Acceleration
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      vaapiIntel         # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      vaapiVdpau
      libvdpau-va-gl
    ];
  ***REMOVED***;


  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "cattop"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  #networking.wireless.iwd.enable = true;
  #networking.networkmanager.wifi.backend = "iwd";

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkbOptions in tty.
  # ***REMOVED***;

  # Enable the X11 windowing system.
  services.xserver.enable = true;


  # Enable the Plasma 5 Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  

  # Configure keymap in X11
  services.xserver.layout = "us";
  # services.xserver.xkbOptions = {
  #   "eurosign:e";
  #   "caps:escape" # map caps to escape.
  # ***REMOVED***;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    #extraModules = [ pkgs.pulseaudio-modules-bt ];
    package = pkgs.pulseaudioFull;
  ***REMOVED***;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.settings = {
    General = {
      Enable = "Source,Sink,Media,Socket";
    ***REMOVED***;
  ***REMOVED***;
  hardware.pulseaudio.extraConfig = "
    load-module module-switch-on-connect
  ";

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.

  users.mutableUsers = false;

  users.users.leo.isNormalUser = true;
  users.users.leo.extraGroups = [ "wheel" ];
  users.users.leo.passwordFile = "/persist/passwords/leo";
  home-manager.users.leo = { pkgs, ... ***REMOVED***: {
#    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    home.packages = [
      pkgs.firefox
      pkgs.zsh
    ];
    programs.bash.enable = true;
    programs.zsh.enable = true;
    programs.starship = {
      enable = true;
    ***REMOVED***;
  ***REMOVED***;

  #fileSystems."/etc/ssh" = {
  #  depends = [ "/persist" ];
  #  neededForBoot = true;
  #***REMOVED***;
  fileSystems."/persist".neededForBoot = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget

  nixpkgs.overlays = [
    (self: super: {
      discord = super.discord.override { withOpenASAR = true; ***REMOVED***;
    ***REMOVED***)
    (self: super: {
      wpa_supplicant = super.wpa_supplicant.overrideAttrs (oldAttrs: rec {
        version = "2.9";
        src = super.fetchurl {
          url = "https://w1.fi/releases/wpa_supplicant-2.9.tar.gz";
          sha256 = "sha256-IN965RVLODA1X4q0JpEjqHr/3qWf50/pKSqR0Nfhey8=";
        ***REMOVED***;
      ***REMOVED***);
    ***REMOVED***)
  ];
 
  environment.systemPackages = with pkgs; [
  #   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by de>
    wget
    starship
    discord
    gnupg
    git
    pinentry
    pinentry-qt
    #config.nur.repos.onny.librewolf-bin
    file
    #kdeFrameworks.kwallet
    #kdeApplications.kwalletmanager
    tailscale
    #agenix.defaultPackage.x86_64-linux
    latte-dock
    wpa_supplicant
    linuxKernel.packages.linux_zen.xone
    age
    gnome.nautilus
  ];  

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; ***REMOVED***)
  ];



  networking.firewall = {
    # enable the firewall
    enable = false;

    # always allow traffic from your Tailscale network
    trustedInterfaces = [ "tailscale0" ];

    # allow the Tailscale UDP port through the firewall
    allowedUDPPorts = [ config.services.tailscale.port ];

    # allow you to SSH in over the public internet
    allowedTCPPorts = [ 22 ];
  ***REMOVED***;


  programs.kdeconnect.enable = true;
  programs.dconf.enable = true;
  programs.nm-applet.enable = true;
  services.tailscale.enable = true;  
  networking.firewall.checkReversePath = "loose";
  services.openssh.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.gvfs.enable = true;


  #age.secrets.tailscale.file = ../secrets/tailscale.age;
  #tskey = (builtins.readFile config.age.secrets.tailscale.path);

  systemd.services.tailscale-autoconnect = {
    description = "Automatic connection to Tailscale";
    # make sure tailscale is running before trying to connect to tailscale 
    after = [ "network-pre.target" "tailscale.service" ];
    wants = [ "network-pre.target" "tailscale.service" ];
    wantedBy = [ "multi-user.target" ];

    # set this service as a oneshot job
    serviceConfig.Type = "oneshot";

    # have the job run this shell script
    script = with pkgs; ''
      # wait for tailscaled to settle
      sleep 2

      # check if we are already authenticated to tailscale
      status="$(${tailscale***REMOVED***/bin/tailscale status -json | ${jq***REMOVED***/bin/jq -r .BackendState)"
      if [ $status = "Running" ]; then # if so, then do nothing
        exit 0
      fi

      # otherwise authenticate with tailscale
      ${tailscale***REMOVED***/bin/tailscale up -authkey ${builtins.readFile /persist/secrets/tailscale***REMOVED***
    '';
  ***REMOVED***;


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # ***REMOVED***;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?


  environment.etc = {
    nixos.source = "/persist/etc/nixos";
    "NetworkManager/system-connections".source = "/persist/etc/NetworkManager/system-connections";
    NIXOS.source = "/persist/etc/NIXOS";
    machine-id.source = "/persist/etc/machine-id";
  ***REMOVED***;
  systemd.tmpfiles.rules = [
    "L /var/lib/NetworkManager/secret_key - - - - /persist/var/lib/NetworkManager/secret_key"
    "L /var/lib/NetworkManager/seen-bssids - - - - /persist/var/lib/NetworkManager/seen-bssids"
    "L /var/lib/NetworkManager/timestamps - - - - /persist/var/lib/NetworkManager/timestamps"
    "L /var/lib/lxd - - - - /persist/var/lib/lxd"
    "L /var/lib/docker - - - - /persist/var/lib/docker"
  ];
  security.sudo.extraConfig = ''
    # rollback results in sudo lectures after each reboot
    Defaults lecture = never
  '';
  boot.initrd.postDeviceCommands = pkgs.lib.mkBefore ''
    mkdir -p /mnt

    # We first mount the btrfs root to /mnt
    # so we can manipulate btrfs subvolumes.
    mount -o subvol=/ /dev/nvme0n1p3 /mnt

    # While we're tempted to just delete /root and create
    # a new snapshot from /root-blank, /root is already
    # populated at this point with a number of subvolumes,
    # which makes `btrfs subvolume delete` fail.
    # So, we remove them first.
    #
    # /root contains subvolumes:
    # - /root/var/lib/portables
    # - /root/var/lib/machines
    #
    # I suspect these are related to systemd-nspawn, but
    # since I don't use it I'm not 100% sure.
    # Anyhow, deleting these subvolumes hasn't resulted
    # in any issues so far, except for fairly
    # benign-looking errors from systemd-tmpfiles.
    btrfs subvolume list -o /mnt/root |
    cut -f9 -d' ' |
    while read subvolume; do
      echo "deleting /$subvolume subvolume..."
      btrfs subvolume delete "/mnt/$subvolume"
    done &&
    echo "deleting /root subvolume..." &&
    btrfs subvolume delete /mnt/root

    echo "restoring blank /root subvolume..."
    btrfs subvolume snapshot /mnt/root-blank /mnt/root

    # Once we're done rolling back to a blank snapshot,
    # we can unmount /mnt and continue on the boot process.
    umount /mnt
  '';

***REMOVED***

