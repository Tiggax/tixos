{ pkgs, ... }:
{
  users.users.tiggax.extraGroups = [ "render" "video" ];

  environment.systemPackages = with pkgs;[
    blender-hip
  ];

  # boot.initrd.kernelModules = [ "amdgpu" ]; # This should maybe be better in hardware.
}
