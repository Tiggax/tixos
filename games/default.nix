{ pkgs, ... }: 
{
  environment.systemPackages = with pkgs;[
    gamemode
  ];

  programs.gamemode = {
    enable = true;   
  };
}