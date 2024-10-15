{pkgs, lib, config, userSettings, home-manager, ...}:
let
    cfg = config.development.rstudio;
in
{
    options.development.rstudio = {
        enable = lib.mkEnableOption "Enable RStudio";
        additionalPackages = lib.mkOption {
            type = lib.types.listOf lib.types.package;
            default = [];
            example = [pkgs.rPackages.tidyverse];
            description = "Additional packages to install";
        };
        knitrSupport = {
            enable = lib.mkEnableOption "Enable Knitr support";
        };
    };



    config = lib.mkIf cfg.enable {

        environment.systemPackages = with pkgs;[

            (rstudioWrapper.override { packages = with pkgs.rPackages; [tidyverse] ++ cfg.additionalPackages ++ (if cfg.knitrSupport.enable then [pandoc] else []); })

        ] ++ (if cfg.knitrSupport.enable then [pkgs.texlive.combined.scheme-full] else []);



    };
}
