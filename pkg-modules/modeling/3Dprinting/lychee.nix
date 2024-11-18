{ appimageTools, fetchurl, ... }:
let
  pname = "Lychee_Slicer";
  version = "7.1.1";

  name = "${pname}-${version}";

  src = fetchurl {
    url = "https://mango-lychee.nyc3.digitaloceanspaces.com/LycheeSlicer-${version}.AppImage";
    sha256 = "sha256-3UEih6i/JkBOCDJ78bkQ3nJ8P07fZCy0a4/t6yGXChA=";
  };
  appimageContents = appimageTools.extractType2 {inherit name src version; };
in
appimageTools.wrapType2 {
  inherit pname version src;


  extraPkgs = pkgs: [];

  extraInstallCommands = ''
    mv $out/bin/${name} $out/bin/${pname}
    install -m 444 -D ${appimageContents}/${pname}.desktop -t $out/share/applications
    substitueInPlace $out/share/applications/${pname}.desktop \
      --replace-fail 'Exec=AppRun' 'Exec=$pname'
    cp -r ${appimageContents}/usr/share/icons $out/share
  '';
  
  meta = {
    description = "Lychee Slicer is a powerful and user-friendly slicing software created to simplify your 3D printing experience. Compatible with over 750 printers, our slicer fits the needs of both beginners and advanced users.";
    homepage = "https://lychee.mango3d.io/resin-sla-msla-3d-printers";
    downloadPage = "https://lychee.mango3d.io/download-lychee-slicer";
    platforms = ["x86_64-linux"];
  };
  
}
