{pkgs, lib, config, ...}:
let
    cfg = config.mymod.kde;
in 
{
    imports = [
        ./desktop.nix
        ./kdeconnect.nix
        ./kdenlive.nix
    ];

    options.mymod.kde = {
        enable = lib.mkEnableOption "Enable the basic KDE Desktop";
    };

    config = lib.mkIf cfg.enable {
        mymod.kde = {
            kdeconnect.enable = true;
            desktop.enable = true;
        };
    };
    
}