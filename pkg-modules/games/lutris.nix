{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
let
  cfg = config.mymod.games.lutris;
in
{
  options.mymod.games.lutris = {
    enable = lib.mkEnableOption "Enable lutris";
  };

  config = lib.mkIf cfg.enable {
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

  };
}
