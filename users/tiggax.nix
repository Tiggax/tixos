{ config, pkgs, ... }:
{
  home.username = "tiggax";
  home.homeDirectory = "/home/tiggax";

  programs.git = {
    enable = true;
    userName = "Tilen Gimpelj";
    userEmail = "66419530+Tiggax@users.noreply.github.com";
  };
  home.packages = with pkgs; [
    gitui

    helix
    nushellFull
    starship
  
    nil

    firefox
    discord
    kate
  ];
  home.stateVersion = "23.05";

  programs.home-manager.enable = true;
}
