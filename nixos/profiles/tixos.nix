{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ../../machines/pc
      ../../pkg-modules
      ../../games
      ../../games/steam
      ../../games/lutris
      ../../games/minecraft
      ../../printers/Firma
      ../../development
    ];

    networking.hostName = "tixos";

    mymod = {
      kde.desktop.enable = true;
      anime.enable = true;
      mysql.enable = true;
      openssh.enable = true;

      obs.enable =  true;

      modeling = {
        enable = true;
        blender.enable = true;

        printing = {
          enable = true;
          lychee.enable = true;
        };
      };

      games = {
        sleepy-launcher.enable = true;
      };
      


    };
    
    development = {
      enable = true;
      rstudio = {
        additionalPackages = with pkgs.rPackages; [
          gt
          gtExtras
          rstatix
          devtools
          pak
          ggimage
        ];
      };
      java = {
        enable = true;
      };
    };

    programs.nix-ld = {
        enable = true;
        libraries = with pkgs; [
            stdenv.cc.cc
            zlib
            fuse3
            icu
            zlib
            nss
            openssl
            curl
            expat
        ];
    };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
