{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.mymod.anime;
in
{
  imports = [
    ./ani-cli.nix
    ./seanime.nix
  ];

  options.mymod.anime = {
    enable = lib.mkEnableOption "Enable Default anime setup";
  };

  config = lib.mkIf cfg.enable {
    mymod.anime.ani-cli.enable = true;
    mymod.anime.seanime.enable = lib.mkDefault true;
  };
}
