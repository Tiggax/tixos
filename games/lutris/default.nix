{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (lutris.override {
      extraPkgs = pkgs: [
        gamescope
        winetricks
        wineWow64Packages.stable
      ];
      extraLibraries = pkgs: [

      ];
    })
  ];
}
