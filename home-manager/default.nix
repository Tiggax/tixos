{ inputs, config, pkgs, userSettings, ... }:
{

  home-manager = {
    extraSpecialArgs = { inherit inputs userSettings; };
    users.${userSettings.username} = {
      home.username = userSettings.username;
    home.homeDirectory = "/home/${userSettings.username}";
    
    home.packages = with pkgs; [
      gitui
      git

      helix
    
      nil

    ];
    home.stateVersion = "24.05";

    programs.home-manager.enable = true;
    };
  };
}
