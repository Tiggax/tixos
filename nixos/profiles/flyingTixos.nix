{config, pkgs, ...}: 

{
    imports = [
        ../../pkgs/kde.nix
        ../../pkgs/anime/ani-cli.nix
        ../../printers/Firma
        ../../development
        ../../development/rust
        ../../pkgs/nushell.nix
        ../../games/steam
    ];

    networking.hostName = "flyingTixos";

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
