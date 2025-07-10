{ config, pkgs, userSettings, home-manager, ... }:
{

  imports = [
    ../pkg-modules
  ];


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
    
      nil

      firefox
      vesktop
      kdePackages.kate
      wezterm
    ];
  };

  users.users.${userSettings.username} = {
    isNormalUser = true;
    description = "Tilen Gimpelj";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      kdePackages.kate
      helix
      git
      gitui
      vesktop
      yazi
      bottom
      wezterm
      typst
      tinymist

      krita
      
      popcorntime
      element-desktop

      # Faculty items
      telegram-desktop
      thunderbird
      zotero
      
      nil
    ];
  };
}
