{pkgs, ... }:
{
  environment.shells = pkgs.nushell;
  users.defaultUserShell = {
    shell = pkgs.nushell;
  };
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

  environment.systemPackages = with pkgs; [
    direnv
  ];
}
