{ config, pkgs, ... }:
{

  home.username = userSettings.username;
  home.homeDirectory = "/home/${userSettings.username}";

  home.packages = with pkgs; [
    gitui
    git

    helix
  
    nil

  ];
  home.stateVersion = "23.05";

  programs.home-manager.enable = true;
}
