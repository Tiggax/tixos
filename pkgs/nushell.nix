{pkgs, ... }:
{

  home-manager.users.${systemSettings.username} = {pkgs, ...}:
  
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

  environment.shells = pkgs.nushell;
  users.defaultUserShell = {
    shell = pkgs.nushell;
  };
  

  environment.systemPackages = with pkgs; [
    direnv
  ];
}
