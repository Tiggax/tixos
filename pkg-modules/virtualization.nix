{
  pkgs,
  lib,
  config,
  userSettings,
  ...
}:
let
  cfg = config.mymod.virt;
in
{
  imports = [
  ];

  options.mymod.virt = {
    enable = lib.mkEnableOption "Enable the Virtualization";
  };

  config = lib.mkIf cfg.enable {

    virtualisation.libvirtd = {
      enable = true;
      qemu.vhostUserPackages = with pkgs; [ virtiofsd ];
    };

    virtualisation.virtualbox.host.enable = true;
    users.extraGroups.vboxusers.members = [ "${userSettings.username}" ];

    programs.virt-manager.enable = true;

    environment.systemPackages = with pkgs; [
      dnsmasq
    ];

    networking.firewall.trustedInterfaces = [ "virbr0" ];

  };

}
