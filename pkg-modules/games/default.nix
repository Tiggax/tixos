{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.mymod.games;
in
{
  imports = [
    ./sleepy-launcher.nix
    ./lutris.nix
  ];

  options.mymod.games = {
    enable = lib.mkEnableOption "Enable Default games";
  };

  config = lib.mkIf cfg.enable {

    mymod.games = {
      sleepy-launcher.enable = lib.mkDefault true;
      lutris.enable = lib.mkDefault true;
    };
  };
}
