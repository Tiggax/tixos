{ config, pkgs, userSettings, home-manager, ... }:
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

  users.users.${userSettings.username} = {
    isNormalUser = true;
    description = "Tilen Gimpelj";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.nushell;
    packages = with pkgs; [
      firefox
      kate
      helix
      nushell
      starship
      git
      gitui
      discord
      yazi
      bottom
      wezterm
      typst
      typst-lsp

      krita
      
      popcorntime
      telegram-desktop
      thunderbird
      
      nil
    ];
  };
}
