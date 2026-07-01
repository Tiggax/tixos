{
  pkgs,
  lib,
  config,
  userSettings,
  ...
}:
let
  cfg = config.mymod.anime.seanime;
in
{

  options.mymod.anime.seanime = {
    enable = lib.mkEnableOption "Enable the seanime app";
    port = lib.mkOption {
      type = lib.types.port;
      default = 43211;
    };
    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.seanime;
      description = "Seanime package.";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      seanime
    ];

    systemd.services.seanime = {
      description = "SaAnime";

      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];
      serviceConfig = {
        User = "${userSettings.username}";
        Group = "users";
        ExecStart = "${cfg.package}/bin/seanime";

        Restart = "always";

      };
    };
  };

}
