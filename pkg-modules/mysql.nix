{pkgs, lib, config, ...}: 
let
    cfg = config.mymod.mysql;
in
{
    options.mymod.mysql = {
        enable = lib.mkEnableOption "Enable MySQeeL server";
    };

    config = lib.mkIf cfg.enable {
        services.mysql = {
            enable = true;
            package = pkgs.mysql84;
        };
    };
}
