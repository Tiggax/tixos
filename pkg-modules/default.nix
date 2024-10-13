{pkgs, lib, config, ...}: {
    imports = [
        ./anime
        ./kde
        ./mysql.nix
        ./nushell.nix
        ./openssh.nix
    ];
    
    nushell.enable = lib.mkDefault true;

}