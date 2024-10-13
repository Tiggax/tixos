{ pkgs, lib, config, ... }:
let
  cfg = config.mymod.kde.kdenlive;
in 
{
  options.mymod.kde.kdenlive = {
    enable = lib.mkEnableOption "Enable KDEnLive";

  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      glaxnimate
      libsForQt5.kdenlive
    ];
  };
}