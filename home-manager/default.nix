{ config, pkgs, userSettings, ... }:
{

  home-manager.${userSettings.username} = {
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

  };
}
