{pkgs, config, lib, ...}: 
let
    cfg = config.development;
in
{
    imports = [
        ./rust
        ./rstudio
        ./java

        ./markdown.nix
    ];

    options.development = {
        enable = lib.mkEnableOption "Enable Development";
    };

    config = lib.mkIf cfg.enable {

        development = {
            rstudio.enable = lib.mkDefault true;
            rstudio.knitrSupport.enable = lib.mkDefault true;
            rust.enable = lib.mkDefault true;

            markdown.enable = lib.mkDefault true;
        };

        
        environment.systemPackages = with pkgs; [
            telegram-desktop
        ];

    };

    

}
