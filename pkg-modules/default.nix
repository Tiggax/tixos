{ pkgs, lib, config, ...}: {
    imports = [
        ./anime
        ./kde
        ./mysql.nix
        ./nushell
        ./openssh.nix
        ./modeling
        ./games
    ];
    
    mymod.nushell.enable = lib.mkDefault true;

}
