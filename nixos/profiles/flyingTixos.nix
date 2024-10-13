{config, pkgs, ...}: 

{
    imports = [
        ../../pkg-modules
        ../../machines/laptop
        ../../printers/Firma
        ../../development
        ../../development/rust
        ../../games/steam
    ];

    networking.hostName = "flyingTixos";

    mymod.kde.desktop.enable = true;

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
