{
  appimageTools,
  fetchurl,
  makeDesktopItem,
  pkgs,
  ...
}:
let
  pname = "snapmaker-orca";
  version = "2.2.4";

  src = fetchurl {
    url = "https://github.com/Snapmaker/OrcaSlicer/releases/download/v${version}/Snapmaker_Orca_Linux_AppImage_Ubuntu2404_V${version}_Beta.AppImage";
    sha256 = "sha256-eX1VYiMSW7sF6c9uKsLu9phpPIuQHlk3EzFxcohHZx4=";
  };

  desktopItem = makeDesktopItem {
    name = pname;
    desktopName = "SnOrca";
    genericName = "SnapMaker Orca FDM Slicer";
    comment = "SnapMaker Orca Slicer Fork for 3D printing";
    exec = pname;
    icon = "Snapmaker_Orca";
    mimeTypes = [
      "model/stl"
      "model/3mf"
      "application/vnd.ms-package"
      "text/x-gcode"
      "application/x-gcode"
      "application/vnd.ms-3mfdocument"
      "application/prs.wavefront-obj"
      "application/x-amf"
    ];
    categories = [
      "Utility"
      "Graphics"
      "3DGraphics"
      "X-3DPrinting"
      "X-Modeling"
    ];
  };

  appimageContents = appimageTools.extractType2 { inherit pname version src; };

in
appimageTools.wrapType2 {
  inherit pname version src;

  extraPkgs =
    pkgs: with pkgs; [
      webkitgtk_4_1
    ];

  meta = {
    description = "SnapMaker Orca slicer fork designed specificaly for the SnapMaker U1 3d printer";
    homepage = "https://www.snapmaker.com/snapmaker-orca";
    downloadPage = "https://github.com/Snapmaker/OrcaSlicer/releases/latest";
    platforms = [ "x86_64-linux" ];
  };

  extraInstallCommands = ''
    mkdir -p $out/share
    cp -r ${appimageContents}/usr/share/icons $out/share/icons
    install -Dm444 ${desktopItem}/share/applications/${pname}.desktop $out/share/applications/${pname}.desktop
  '';
}
