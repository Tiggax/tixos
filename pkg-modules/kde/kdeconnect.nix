{ pkgs, lib, config, ... }:
let 
  cfg = config.mymod.kde.kdeconnect;
in 
{
  options.mymod.kde.kdeconnect = {
    enable = lib.mkEnableOption "Enable KDE Connect";
  };

  config =  lib.mkIf cfg.enable {
    programs.kdeconnect.enable = true;
    environment.systemPackages = with pkgs; [
      libsForQt5.kdeconnect-kde
    ];
  };
  
}