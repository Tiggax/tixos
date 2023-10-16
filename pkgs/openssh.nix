{ pkgs, ... }:
{
services = {
  sshguard = {
    enable = true;
    blocktime = 300;
  };
  openssh = {
    enable = true;
    ports = [ 505 ];
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
  ];
}
