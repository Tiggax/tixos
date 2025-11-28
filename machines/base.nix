{ inputs, lib, pkgs, ... }:
{
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      # creates links between same files, reduces space :)
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      persistent = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };
  boot = {
     loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 5;
      };
      
      efi.canTouchEfiVariables = true;
    };
    supportedFilesystems = ["ntfs"];
  };
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Ljubljana";
  
  i18n = {
    defaultLocale = "en_GB.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "sl_SI.UTF-8";
      LC_IDENTIFICATION = "sl_SI.UTF-8";
      LC_MEASUREMENT = "sl_SI.UTF-8";
      LC_MONETARY = "sl_SI.UTF-8";
      LC_NAME = "sl_SI.UTF-8";
      LC_NUMERIC = "sl_SI.UTF-8";
      LC_PAPER = "sl_SI.UTF-8";
      LC_TELEPHONE = "sl_SI.UTF-8";
      LC_TIME = "sl_SI.UTF-8";    
      };
  };

  console.keyMap = "slovene";

  services.printing.enable = true;
  services.xserver = {
    xkb = {
      layout = "si";
      variant = "";
    };
  };

  fonts.packages = with pkgs; [
    nerd-fonts.noto
    nerd-fonts.hack
    nerd-fonts.meslo-lg
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];
  
  environment.systemPackages = with pkgs; [
    nushell
    direnv
    helix
    git
    tree
    mpv
    nil
    winbox4 # For router access
  ];
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
