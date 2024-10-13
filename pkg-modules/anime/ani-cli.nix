{pkgs, lib, config, ... }: 
let
  cfg = config.mymod.anime.ani-cli;
in
{

  options.mymod.anime.ani-cli = {
    enable = lib.mkEnableOption "Enable the ani-cli app";
  };

  config = {
    environment.systemPackages = with pkgs; [
      ani-cli
      mpv # required to play
    ];
  };

}
