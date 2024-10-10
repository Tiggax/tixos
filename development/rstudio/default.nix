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
    };

    config = lib.mkIf cfg.enable {
        environment.systemPackages = with pkgs; with rPackages;[
            rstudio

            # Packages
            tidyverse

        ] ++ cfg.additionalPackages;
    };
}