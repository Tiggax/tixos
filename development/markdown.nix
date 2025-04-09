
{pkgs, lib, config, userSettings, home-manager, ...}:
let
    cfg = config.development.markdown;
in
{
    options.development.markdown = {
      enable = lib.mkEnableOption "Enable Markdown development";
    };

    config = lib.mkIf cfg.enable {

      environment.systemPackages = with pkgs;[
        marksman
      ];
    };
}
