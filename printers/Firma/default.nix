{ pkgs, ...}:
{
  services = {
    avahi = {
      enable = true; # runs the Avahi daemon
      nssmdns4 = true; # enables the mDNS NSS plug-in
      openFirewall = true;
    };
    printing = {
      enable = true;
      drivers = with pkgs; [
        foomatic-db-ppds
      ];
    };
  };
}
