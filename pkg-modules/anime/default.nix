{pkgs, lib, config, ...}:
let
    cfg = config.mymod.anime;
in
{

    options.mymod.anime = {
        enable = lib.mkEnableOption "Enable Default anime setup";
    };

    config = lib.mkIf cfg.enable {
        mymod.anime.ani-cli.enable = true;
    };
}