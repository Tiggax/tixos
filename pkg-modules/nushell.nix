{pkgs, lib, config, userSettings, home-manager, ... }:
let
  cfg = config.nushell;
in
{
  options.nushell = {
    enable = lib.mkEnableOption "Enable Nushell";
    default-shell = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = true;
      description = "Wether to use Nushell as a default shell";
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager = {
      users.${userSettings.username} = {
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

        home.packages = with pkgs; [
          nushell
          starship
          direnv
        ];
      };
    };

    environment.shells = [ pkgs.nushell ];
    users.defaultUserShell = pkgs.nushell;
    

    environment.systemPackages = with pkgs; [
      direnv
      nushell
      starship
    ];

    users.users.${userSettings.username} = {
      packages = with pkgs; [
        direnv
        nushell
        starship
      ];
      shell = lib.mkIf cfg.default-shell pkgs.nushell;
    };
  };
}
