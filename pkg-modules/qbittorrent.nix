{
  pkgs,
  lib,
  config,
  userSettings,
  ...
}:
let
  cfg = config.mymod.qbittorrent;
in
{

  options.mymod.qbittorrent = {
    enable = lib.mkEnableOption "Enable the qbittorrent";

  };

  config = lib.mkIf cfg.enable {

    services.qbittorrent.enable = true;

  };

}
