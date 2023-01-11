final: prev: rec {
  gd-launcher = prev.callPackage ./gdlauncher { };
  discord-qt = prev.callPackage ./discord-qt { };
}
