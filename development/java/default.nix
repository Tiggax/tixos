{pkgs, lib, config, userSettings, home-manager, ...}:
let
    cfg = config.development.java;
in
{
    options.development.java = {
      enable = lib.mkEnableOption "Enable Java development";
    };



    config = lib.mkIf cfg.enable {
      programs.java = {
        enable = true;
      };

      environment.systemPackages = with pkgs;[
        jetbrains.idea-community
      ];



    };
}
