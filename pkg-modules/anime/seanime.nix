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

    torrents = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      cfg.package
    ];

    systemd.user.services.seanime = {
      description = "SeAnime Server instance";

      wantedBy = [ "default.target" ];
      after = [ "network.target" ];
      serviceConfig = {
        User = userSettings.username;
        Group = "users";

        ExecStart = "${cfg.package}/bin/seanime";
        Restart = "always";

      };
      path = (with pkgs; [ mpv ]);
    };

    mymod.qbittorrent.enable = lib.mkIf cfg.torrents true;
  };

}
