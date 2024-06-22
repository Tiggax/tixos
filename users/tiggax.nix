{ config, pkgs, ... }:
{

  home-manager.users.${userSettings.username} = {pkgs, ...}:
  
  {
    programs.git = {
      enable = true;
      userName = "Tilen Gimpelj";
      userEmail = "66419530+Tiggax@users.noreply.github.com";
    };
    home.packages = with pkgs; [
      gitui
      git

      helix
      nushell
      starship
    
      nil

      firefox
      discord
      kate
      wezterm
    ];
  };

}
