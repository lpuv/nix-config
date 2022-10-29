# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... ***REMOVED***:

{
  imports =
    [ (modulesPath + "/profiles/qemu-guest.nix")
    ];

  boot.initrd.availableKernelModules = [ "uhci_hcd" "ehci_pci" "ahci" "virtio_pci" "virtio_scsi" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/7dca2a0b-447d-4655-9abc-c83fb8a83712";
      fsType = "btrfs";
      options = [ "subvol=root" ];
    ***REMOVED***;

  boot.initrd.luks.devices."enc".device = "/dev/disk/by-uuid/8fc6739a-e4bf-477a-9a8b-81308c2a5767";

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/7dca2a0b-447d-4655-9abc-c83fb8a83712";
      fsType = "btrfs";
      options = [ "subvol=home" ];
    ***REMOVED***;

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/7dca2a0b-447d-4655-9abc-c83fb8a83712";
      fsType = "btrfs";
      options = [ "subvol=nix" ];
    ***REMOVED***;

  fileSystems."/persist" =
    { device = "/dev/disk/by-uuid/7dca2a0b-447d-4655-9abc-c83fb8a83712";
      fsType = "btrfs";
      options = [ "subvol=persist" ];
    ***REMOVED***;

  fileSystems."/var/log" =
    { device = "/dev/disk/by-uuid/7dca2a0b-447d-4655-9abc-c83fb8a83712";
      fsType = "btrfs";
      options = [ "subvol=log" ];
      neededForBoot = true;
    ***REMOVED***;

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/8FAD-EAAC";
      fsType = "vfat";
    ***REMOVED***;

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp6s18.useDHCP = lib.mkDefault true;

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
***REMOVED***
