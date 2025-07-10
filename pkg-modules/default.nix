{ pkgs, lib, config, ...}: {
    imports = [
        ./anime
        ./kde
        ./mysql.nix
        ./nushell
        ./openssh.nix
        ./modeling
        ./games
        ./obs.nix
    ];
    
    mymod.nushell.enable = lib.mkDefault true;

}
