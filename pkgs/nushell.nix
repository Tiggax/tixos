{pkgs, userSettings, home-manager, ... }:
{

  home-manager.users.${userSettings.username} = {pkgs, ...}:
  
  {
    programs = {
      nushell = {
        enable = true;
        
      };
      starship = {
        enable = true;
        settings = {
          add_newline = true;
        };
      };
    };
  };

  environment.shells = [ pkgs.nushell ];
  users.defaultUserShell = pkgs.nushell;
  

  environment.systemPackages = with pkgs; [
    direnv
  ];
}
