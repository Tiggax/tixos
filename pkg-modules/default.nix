{pkgs, lib, config, ...}: {
    imports = [
        ./kde
        ./nushell.nix
        ./openssh.nix
    ];
    
    nushell.enable = lib.mkDefault true;

}