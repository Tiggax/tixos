{ pkgs, lib, config, ...}: {
    imports = [
        ./anime
        ./kde
        ./mysql.nix
        ./nushell.nix
        ./openssh.nix
        ./modeling
    ];
    
    nushell.enable = lib.mkDefault true;

}
