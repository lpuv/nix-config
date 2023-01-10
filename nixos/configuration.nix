{ inputs, config, pkgs, lib, ... }:

let gdlauncher = pkgs.callPackage ../packages/gdlauncher {};

in {


  security.pki.certificateFiles = [ "/home/leo/lausd.crt" "/home/leo/lausd2.crt" "/home/leo/lausd3.crt" "/home/leo/lausd4.crt" "/home/leo/lausd5.crt" "/home/leo/lausd-root-ca2.crt" "/home/leo/lausd-sub-ca2.crt" "/home/leo/controlplane-tailscale-com.crt" "/home/leo/controlplane2.crt" ];
  security.pki.certificates = [
  ''
      -----BEGIN CERTIFICATE-----
      MIIChzCCAW+gAwIBAgISfyhgWL0bKlG/Ly4NKchsHoZ6MA0GCSqGSIb3DQEBCwUA
      MBoxGDAWBgNVBAMTD3RydXN0LmxhdXNkLm5ldDAeFw0yMjEwMTcxMDAwMjJaFw0y
      MzAxMTUxMDAwMjFaMCUxIzAhBgNVBAMTGmNvbnRyb2xwbGFuZS50YWlsc2NhbGUu
      Y29tMFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAE5KsQhOoHNU7I5prZ5kMJgTK+
      r4bFKPiPWCYtU/gTv5W2Jo2ijHzGEdtarh8f3zdWDKdPNflzGcc16ekCk82x06OB
      hjCBgzAOBgNVHQ8BAf8EBAMCB4AwHQYDVR0lBBYwFAYIKwYBBQUHAwEGCCsGAQUF
      BwMCMAwGA1UdEwEB/wQCMAAwHQYDVR0OBBYEFAx+BFAvh8+MBz8e+LhiWpcFLki8
      MCUGA1UdEQQeMByCGmNvbnRyb2xwbGFuZS50YWlsc2NhbGUuY29tMA0GCSqGSIb3
      DQEBCwUAA4IBAQCepSDLiR5lhZFXhCTNqexh/FnPJ/z3cEVqaz/342ipACB/u6rE
      OQM9kb51Hzw2VLA5/cBi4tefeJWxwDZszzLyWGq9H7PInc93KZFj/4MjJ0CF6Sq4
      Ow+tpkyT4/qA1ei6V2+x1ZK25CWkumFz9AgNn1IBvYwlOsmVO5gKJW8e1ZskSJcl
      aUBHJlYSEHC+pOdKn+ByQh9P79qgMLvAlEUdsL3k3s6padSrO7ueE5QS4u9per2/
      uLgp1HfpLqB0fuoV1JUZ0JFEMmk1H8a3z0igvgiG7pLG17+Do1YrOu6DGrol3pXO
      kTfCA/v7lZX387s9j3v5BnQ72mjAY/uoMnL0
      -----END CERTIFICATE-----
      -----BEGIN CERTIFICATE-----
      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
      /qwhPd/L29leoA==
      -----END CERTIFICATE-----

    ''
  ];

  nixpkgs.overlays = [
    (import inputs.emacs-overlay) 
    inputs.fenix.overlays.default
    (self: super: {
      discord-ptb = super.discord-ptb.override { 
        withOpenASAR = true; 
        nss = pkgs.nss_latest;
      };
    })
    (self: super: {
      wpa_supplicant = super.wpa_supplicant.overrideAttrs (oldAttrs: rec {
        patches = (oldAttrs.patches or [ ])
          ++ [ ../patches/wpa_lower_security.patch ];
      });
    })
  ];

  nix.settings = {
    substituters = [ "https://nix-gaming.cachix.org" "https://nix-community.cachix.org" ];
    trusted-public-keys = [ "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4=" "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=" ];
  };


  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.android_sdk.accept_license = true;

  virtualisation = {
    docker.enable = true;
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
    inputs.nix-gaming.nixosModules.pipewireLowLatency
  ];

  environment.variables = rec {
    QT_WAYLAND_DISABLE_FIXED_POSITIONS="1";
  };

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
    };
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
    };
  };

  systemd.services.systemd-udevd.restartIfChanged = false;
  systemd.services.NetworkManager-wait-online.enable = false;

  systemd.services.wpa_supplicant.environment = {
    OPENSSL_CONF = "/etc/wpa_supplicant/openssl.cnf";
  };

  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball
      "https://github.com/nix-community/NUR/archive/master.tar.gz") {
        inherit pkgs;
      };
  };

  boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;
  boot.extraModprobeConfig = ''
    options kvm                 ignore_msrs=1
  '';


  boot.kernelParams = [ "resume_offset=71439" ];
  boot.resumeDevice = "/dev/disk/by-uuid/2f48bd50-c19b-48df-b468-6a2aa20c6950";
  #boot.initrd.systemd.enable = true;
  boot.supportedFilesystems = [ "btrfs" ];
  hardware.enableAllFirmware = true;

  # Graphics Acceleration
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      vaapiIntel # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      vaapiVdpau
      intel-compute-runtime
      libvdpau-va-gl
    ];
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "cattop"; # Define your hostname.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.
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
  # };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.usbmuxd.enable = true;
  
  # Mullvad
  services.mullvad-vpn.enable = true;
  services.mullvad-vpn.package = pkgs.mullvad-vpn;

  # Emacs
  services.emacs.enable = true;
  services.emacs.package = with pkgs; ((emacsPackagesFor emacsPgtkNativeComp).emacsWithPackages (epkgs: [ epkgs.vterm epkgs.ctrlf ]));

  services.kbfs.enable = true;
  services.keybase.enable = true;
  services.openvpn.servers = {
    thm = { config = '' config /home/leo/THM/gamercat.ovpn ''; };
  };
  services.pcscd.enable = true;
  services.xserver.displayManager.sddm.settings.Wayland.SessionDir = "${pkgs.plasma5Packages.plasma-workspace}/share/wayland-sessions";
  services.flatpak.enable = true;
  services.cpupower-gui.enable = true;
  services.power-profiles-daemon.enable = false;
  services.thermald.enable = true;
  services.acpid.enable = true;
  services.fwupd.enable = true;
  services.vnstat.enable = true;
  services.auto-cpufreq.enable = true;
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_SCALING_GOVERNOR_ON_AC = "powersave";
      TLP_DEFAULT_MODE = "BAT";

      # The following prevents the battery from charging fully to
      # preserve lifetime. Run `tlp fullcharge` to temporarily force
      # full charge.
      # https://linrunner.de/tlp/faq/battery.html#how-to-choose-good-battery-charge-thresholds
      START_CHARGE_THRESH_BAT0 = 85;
      STOP_CHARGE_THRESH_BAT0 = 90;

      # 100 being the maximum, limit the speed of my CPU to reduce
      # heat and increase battery usage:
      CPU_MAX_PERF_ON_AC = 90;
      CPU_MAX_PERF_ON_BAT = 30;
    };
  };


  # Enable the Plasma 5 Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Configure keymap in X11
  services.xserver.layout = "us";
  services.xserver.xkbVariant = "altgr-intl";
  # services.xserver.xkbOptions = {
  #   "eurosign:e";
  #   "caps:escape" # map caps to escape.
  # };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  #hardware.pulseaudio = {
  #  enable = true;
    #extraModules = [ pkgs.pulseaudio-modules-bt ];
  #  package = pkgs.pulseaudioFull;
  #};
  hardware.bluetooth.enable = true;
  hardware.bluetooth.settings = {
    General = { Enable = "Source,Sink,Media,Socket"; };
  };
  hardware.pulseaudio.extraConfig =
    "\n    load-module module-switch-on-connect\n  ";

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.

  users.mutableUsers = false;

  users.users.leo.isNormalUser = true;
  users.users.leo.extraGroups = [ "wheel" "libvirtd" "wireshark" ];
  environment.shells = with pkgs; [ zsh ];
  users.users.leo.passwordFile = "/persist/passwords/leo";
  home-manager.users.leo = { pkgs, ... }: {
    imports = [ ../home-manager/home.nix ];
    home.stateVersion = "22.05";
    home.packages = [ pkgs.firefox pkgs.zsh ];
    programs.bash.enable = true;
    programs.zsh.enable = true;
    programs.starship = { enable = true; };
  };

  #fileSystems."/etc/ssh" = {
  #  depends = [ "/persist" ];
  #  neededForBoot = true;
  #};
  fileSystems."/persist".neededForBoot = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget

  services.pipewire = {
    media-session.config.bluez-monitor.rules = [
    {
      # Matches all cards
      matches = [ { "device.name" = "~bluez_card.*"; } ];
      actions = {
        "update-props" = {
          "bluez5.reconnect-profiles" = [ "hfp_hf" "hsp_hs" "a2dp_sink" ];
          # mSBC is not expected to work on all headset + adapter combinations.
          "bluez5.msbc-support" = true;
          # SBC-XQ is not expected to work on all headset + adapter combinations.
          "bluez5.sbc-xq-support" = true;
        };
      };
    }
    {
      matches = [
        # Matches all sources
        { "node.name" = "~bluez_input.*"; }
        # Matches all outputs
        { "node.name" = "~bluez_output.*"; }
      ];
    }
    ];
    enable = true;
    # alsa is optional
    alsa.enable = true;
    alsa.support32Bit = true;
    # needed for osu
    pulse.enable = true;

    # the star of the show
    lowLatency.enable = true;

    # defaults (no need to be set unless modified)
    lowLatency = {
      quantum = 64;
      rate = 48000;
    };
  };

  # make pipewire realtime-capable
  security.rtkit.enable = true;

  powerManagement.powertop.enable = true;


  environment.systemPackages = with pkgs; with inputs.nix-alien.packages.x86_64-linux; [
    wget
    python310Packages.pip
    libcxx
    jetbrains.gateway
    freetype
    tcl
    iucode-tool
    remind
    xdg-desktop-portal-gtk
    tk
    python3Full
    python310Packages.tkinter
    gnumake
    wl-clipboard
    neovim
    rustc
    cargo
    gdlauncher
    hfsprogs
    gparted
    nim
    kmix
    ((emacsPackagesFor emacsPgtkNativeComp).emacsWithPackages (epkgs: [ epkgs.vterm epkgs.ctrlf ]))
    steam-tui
    steamcmd
    inputs.nix-gaming.packages.${pkgs.system}.wine-discord-ipc-bridge
    inputs.nix-gaming.packages.${pkgs.system}.wine-ge
    (fenix.complete.withComponents [
        "cargo"
        "clippy"
        "rust-src"
        "rustc"
    	"rustfmt"
    ])
    rust-analyzer-nightly
    texlive.combined.scheme-small
    python39Packages.libxml2.out
    nix-alien
    openssl
    libimobiledevice
    usbutils
    libirecovery
    acpi
    feh
    xorg.xrandr
    appimage-run
    termshark
    intel-ocl
    dmidecode
    libsForQt5.ksshaskpass
    xwayland
    powertop
    screen
    virt-manager
    gcc
    starship
    discord-ptb
    gnupg
    git
    pinentry
    pinentry-qt
    #config.nur.repos.onny.librewolf-bin
    file
    #kdeFrameworks.kwallet
    #kdeApplications.kwalletmanager
    tailscale
    libsecret
    #agenix.defaultPackage.x86_64-linux
    latte-dock
    plank
    wpa_supplicant
    linuxKernel.packages.linux_zen.xone
    age
    gnome.nautilus
    bamf
    glib
  ];

  fonts.fontDir.enable = true;

  fonts.fonts = with pkgs;
    [ 
      (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; }) 
      noto-fonts-emoji
      fira-code
      fira-code-symbols
    ];

  environment.etc.hosts.mode = "0644";
  networking.hostFiles = [ ../hosts.txt ];

  nixpkgs.config.permittedInsecurePackages = [
    "python-2.7.18.6"
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
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  };

  programs.kdeconnect.enable = true;
  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark-qt;
  };
  programs.dconf.enable = true;
  programs.nm-applet.enable = true;
  services.tailscale.enable = true;
  networking.firewall.checkReversePath = "loose";
  services.openssh.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.gvfs.enable = true;
  services.bamf.enable = true;

  #age.secrets.tailscale.file = ../secrets/tailscale.age;
  #tskey = (builtins.readFile config.age.secrets.tailscale.path);

  systemd.services.create-swapfile = {
    serviceConfig.Type = "oneshot";
    wantedBy = [ "swap-swapfile.swap" ];
    script = ''
      swapfile="/swap/swapfile"
      if [[ -f "$swapfile" ]]; then
        echo "Swap file $swapfile already exists, taking no action"
      else
        echo "Setting up swap file $swapfile"
        ${pkgs.e2fsprogs}/bin/chattr +C "$swapfile"
        ${pkgs.coreutils}/bin/truncate -s 0 "$swapfile"
        ${pkgs.coreutils}/bin/chown root "$swapfile"
        ${pkgs.coreutils}/bin/chmod 600 "$swapfile"
      fi
    '';
  };

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
      status="$(${tailscale}/bin/tailscale status -json | ${jq}/bin/jq -r .BackendState)"
      if [ $status = "Running" ]; then # if so, then do nothing
        exit 0
      fi

      # otherwise authenticate with tailscale
      ${tailscale}/bin/tailscale up --reset -authkey file:/persist/secrets/tailscale
    '';
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

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
    "NetworkManager/system-connections".source =
      "/persist/etc/NetworkManager/system-connections";
    NIXOS.source = "/persist/etc/NIXOS";
    machine-id.source = "/persist/etc/machine-id";
  };
  systemd.tmpfiles.rules = [
    "L /var/lib/NetworkManager/secret_key - - - - /persist/var/lib/NetworkManager/secret_key"
    "L /var/lib/NetworkManager/seen-bssids - - - - /persist/var/lib/NetworkManager/seen-bssids"
    "L /var/lib/NetworkManager/timestamps - - - - /persist/var/lib/NetworkManager/timestamps"
    "L /var/lib/lxd - - - - /persist/var/lib/lxd"
    "L /var/lib/docker - - - - /persist/var/lib/docker"
    "L /var/lib/bluetooth 700 root root - /persist/var/lib/bluetooth"
    "L /var/cache/mullvad-vpn - - - - /persist/var/cache/mullvad-vpn"
  ];
  

  fileSystems."/var/lib/bluetooth" = {
    device = "/persist/var/lib/bluetooth";
    options = [ "bind" "noauto" "x-systemd.automount" ];
    noCheck = true;
  };
  fileSystems."/var/lib/libvirt" =
    { device = "/dev/disk/by-uuid/2f48bd50-c19b-48df-b468-6a2aa20c6950";
      fsType = "btrfs";
      options = [ "subvol=libvirt" "compress=zstd" "noatime" ];
    };
  systemd.targets."bluetooth".after = [ "systemd-tmpfiles-setup.service" ];
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

}

