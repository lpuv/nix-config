{ fetchurl
, appimageTools
, lib
}:
let
  name = "discord-qt";
  src = fetchurl {
    url = "https://github.com/ruslang02/discord-qt/releases/download/v0.5.1/DiscordQt-v0.5.1-linux-x64.AppImage";
    sha256 = "sha256-IVsrAuNYR4bybTgI9XWo1oEM4f9HdouPapkQWE5huqE=";
  };
  appimageContents = appimageTools.extractType2 { inherit name src; };
in appimageTools.wrapType2 {
  inherit name src;

  extraInstallCommands = ''
    
    # Installs .desktop files
    install -Dm444 ${appimageContents}/default.desktop -t $out/share/applications
    install -Dm444 ${appimageContents}/default.png -t $out/share/pixmaps
    mv $out/share/applications/default.desktop $out/share/applications/${name}.desktop
    mv $out/share/pixmaps/default.png $out/share/pixmaps/${name}.png
    #substituteInPlace $out/share/applications/${name}.desktop \
    #  --replace 'Exec=AppRun --no-sandbox %U' 'Exec=${name}'
  '';
  
}
