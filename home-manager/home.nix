# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)

{ inputs, lib, config, pkgs, ... ***REMOVED***:
with pkgs; {
  nixpkgs.config.allowUnfree = true;
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors), use something like:
    # inputs.nix-colors.homeManagerModule

    # Feel free to split up your configuration and import pieces of it here.
  ];

  # TODO: Set your username
  home = {
    username = "leo";
    homeDirectory = "/home/leo";
    sessionVariables = { EDITOR = "nano"; ***REMOVED***;
  ***REMOVED***;

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    shellAliases = {
      ll = "ls -l";
      update =
        "cd /home/leo/nix-config && sudo nixos-rebuild switch --flake .#cattop";
    ***REMOVED***;
    history = {
      size = 10000;
      path = "${config.xdg.dataHome***REMOVED***/zsh/history";
    ***REMOVED***;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "thefuck" ];
      theme = "agnoster";
    ***REMOVED***;
  ***REMOVED***;

  # Add stuff for your user as you see fit:
  programs.neovim.enable = true;
  home.packages = with pkgs; [
    firefox
    nano
    git
    yubioath-desktop
    mailspring
    zsh
    starship
    jetbrains.idea-ultimate
    jetbrains.pycharm-professional
    python3
    jdk11
    ipmiview
    thefuck
    unzip
    spotify
    flameshot
    ghidra
    element-desktop
    killall
    bind
    espanso
    nixfmt
  ];

  programs.starship.enable = true;
  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;


  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.05";
***REMOVED***
