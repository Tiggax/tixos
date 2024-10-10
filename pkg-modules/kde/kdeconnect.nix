{ pkgs, lib, config, ... }:
let 
  cfg = config.kdeconnect;
in 
{
  options.kdeconnect = {
    enable = lib.mkEnableOption "Enable KDE Connect";
  };

  config =  lib.mkIf cfg.enable {
    programs.kdeconnect.enable = true;
    environment.systemPackages = with pkgs; [
      libsForQt5.kdeconnect-kde
    ];
  };
  
}