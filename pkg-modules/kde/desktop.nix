{ pkgs, lib, config, ... }:
let
  cfg = config.mymod.kde.desktop;
in
{
  imports = [./kdeconnect.nix];
  options.mymod.kde.desktop = {
    enable = lib.mkEnableOption "Enable KDE Desktop";

  };

config = lib.mkIf cfg.enable {

  mymod.kde.kdeconnect.enable = lib.mkDefault true;


  services = {
    xserver.enable = true;
    displayManager.sddm.enable = true;
    desktopManager.plasma6 = {
      enable = true;
    };
  };

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
};



}
