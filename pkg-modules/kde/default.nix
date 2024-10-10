{pkgs, lib, config, ...}:{
    imports = [
        ./desktop.nix
        ./kdeconnect.nix
        ./kdenlive.nix
    ];    
}