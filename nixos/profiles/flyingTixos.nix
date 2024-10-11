{config, pkgs, ...}: 

{
    imports = [
        ../../pkgs/kde.nix
        ../../pkgs/anime/ani-cli.nix
        ../../printers/Firma
        ../../development
        ../../pkgs/nushell.nix
        ../../games/steam
    ];

    networking.hostName = "flyingTixos";

    development.enable = true;
    development.rstudio.additionalPackages = with pkgs; with rPackages;[ UniprotR bio3d ];

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

}
