{ pkgs, lib, config, ...}: {
    imports = [
        ./anime
        ./kde
        ./mysql.nix
        ./nushell
        ./openssh.nix
        ./modeling
    ];
    
    mymod.nushell.enable = lib.mkDefault true;

}
