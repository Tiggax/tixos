{ appimageTools, fetchurl, ... }:
let
  pname = "lycheeslicer";
  version = "7.1.2";

  name = "${pname}-${version}";

  src = fetchurl {
    url = "https://mango-lychee.nyc3.digitaloceanspaces.com/LycheeSlicer-${version}.AppImage";
    sha256 = "sha256-/hpM1/OzjLWssKJL6p3olWS2qNi5AhVYi7ycK8OF4rU=";
  };
  
  desktopFile = ''
    [Desktop Entry]
    Name=Lychee Slicer
    Comment=Lychee Slicer for 3D printing
    Exec= $out/bin/${pname} --no-sandbox %U
    Terminal=false
    Type=Application
    Icon=${pname}
    MimeType=x-scheme-handler/lycheeslicer;model/stl;
    Categories=Graphics;3DGraphics;
  '';

  appimageContents = appimageTools.extractType2 { inherit name src; };
in
appimageTools.wrapType2 {
  inherit pname version src;

  extraPkgs = pkgs: [];

  extraInstallCommands = ''
    mkdir -p $out/share/applications
    echo "${desktopFile}" > $out/share/applications/${pname}.desktop

    cp -r ${appimageContents}/usr/share/icons $out/share/icons
  '';

    
  meta = {
    description = "Lychee Slicer is a powerful and user-friendly slicing software created to simplify your 3D printing experience. Compatible with over 750 printers, our slicer fits the needs of both beginners and advanced users.";
    homepage = "https://lychee.mango3d.io/resin-sla-msla-3d-printers";
    downloadPage = "https://lychee.mango3d.io/download-lychee-slicer";
    platforms = ["x86_64-linux"];
  };
  
}
