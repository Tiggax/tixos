{ pkgs, lib, config, ... }:
let
  cfg = config.mymod.openssh;
in
{
  options.mymod.openssh = {
    enable = lib.mkEnableOption "Enable OpenSSH";
    ports = lib.mkOption {
      type = lib.types.listOf lib.types.port;
      default = [ 505 ];
      example = [ 22 ];
      description = "List of ports for ssh to use";
    };
      
  };

  config = lib.mkIf cfg.enable {
    services = {
      sshguard = {
        enable = true;
        blocktime = 300;
      };
      openssh = {
        enable = true;
        ports = cfg.ports;
        settings = {
          X11Forwarding = true;
          PermitRootLogin = "no"; # disable root login
          PasswordAuthentication = true; # disable password login
        };
        openFirewall = true;
      };
    };

    environment.systemPackages = with pkgs;[
      sshguard
      waypipe # FOR WAYLAND REMOTE FORWARDING
    ];
  };
}
