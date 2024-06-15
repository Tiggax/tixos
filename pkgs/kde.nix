{ pkgs, ... }:
{
  imports = [./kdeconnect.nix];

services = {
  xserver.enable = true;
  displayManager = {
    sddm.enable = true;
    plasma6.enable = true;
  };
};

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

}
