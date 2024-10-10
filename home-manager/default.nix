{ inputs, config, pkgs, userSettings, ... }:
{

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs userSettings; };
    backupFileExtension = "ohm";
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
