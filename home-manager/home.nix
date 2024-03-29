# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)

{ inputs, lib, config, pkgs, ... }:
with pkgs; {

  xdg.systemDirs.data = [
    "/var/lib/flatpak/exports/share"
    "/home/leo/.local/share/flatpak/exports/share"
  ];

  nixpkgs.config.allowUnfree = true;
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors), use something like:
    # inputs.nix-colors.homeManagerModule

    # Feel free to split up your configuration and import pieces of it here.
  ];

  home = {
    username = "leo";
    homeDirectory = "/home/leo";
    sessionVariables = { EDITOR = "lvim"; GIT_ASKPASS = "/run/current-system/sw/bin/ksshaskpass"; };
    file.".config/setwaylandtheme.sh".source = ../dotfiles/setwaylandtheme.sh;
  };

  programs.rofi = {
    enable = true;
    terminal = "${pkgs.wezterm}/bin/wezterm";
    theme = ../simple-tokyonight.rasi;
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    shellAliases = {
      ll = "ls -l";
      update =
        "cd /home/leo/nix-config && nix flake update && sudo nixos-rebuild switch --upgrade --flake .#cattop";
      discordo = "cd /home/leo && nix-alien discordo";
      flowblade = "GDK_BACKEND=x11 SDL_VIDEODRIVER=x11 flowblade";
      latte = "QT_WAYLAND_DISABLE_FIXED_POSITIONS=1 latte-dock --replace";
      hw = "cd /home/leo/distraction-destroyer && sudo ./distraction-destroyer.sh";
      casecure = "cd /home/leo/CASecureBrowser/usr/bin/ && steam-run ./CASecureBrowser";
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "thefuck" ];
      theme = "agnoster";
    };
  };

  # Add stuff for your user as you see fit:
  programs.neovim.enable = true;
  home.sessionPath = ["$HOME/.local/bin" "$HOME/.emacs.d/bin" "$HOME/.npm-packages/bin"];
  home.packages = with pkgs; [
    gmic
    xca
    ferium
    firefox
    filelight
    vale
    nodePackages.node2nix
    languagetool
    vlc
    sqlite
    wordnet
    coder
    ispell
    ripgrep
    fd
    xournalpp
    flowblade
    jellyfin-media-player
    hollywood
    lolcat
    cmatrix
    libsForQt5.bismuth
    vivaldi
    flyctl
    libsForQt5.akonadi
    korganizer
    vlang
    kdenlive
    libxml2
    libxml2.dev
    nix-index
    steam-run
    patchelf
    ventoy-bin
    vscode-fhs
    zip
    usbmuxd
    libusbmuxd
    abiword
    mpv
    yt-dlp
    #tartube-yt-dlp
    tor-browser-bundle-bin
    ffmpeg
    nodejs
    lutris
    bottles
    sshuttle
    traceroute
    quickemu
    borgbackup
    #metasploit
    rustscan
    feroxbuster
    python3Packages.virtualenv
    remmina
    prismlauncher
    p7zip
    i7z
    unrar
    john
    hashcat
    spice
    spice-gtk
    virt-viewer
    rbw
    bitwarden
    bitwarden-cli
    nano
    git
    yubioath-flutter
    mailspring
    zsh
    starship
    jetbrains.idea-ultimate
    jetbrains.rider
    jetbrains.pycharm-professional
    jdk11
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
    neofetch
    maestral-gui
    maestral
    ungoogled-chromium
    #ipmicfg
    libreoffice
    bpytop
    axel
    bfg-repo-cleaner
    exiftool
    obsidian
  ];

  programs.starship.enable = true;
  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.05";
}
