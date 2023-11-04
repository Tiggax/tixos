{ pkgs, ... }:
{
  users.users.tiggax.extraGroups = [ "render" "video" ];

  environment.systemPackages = with pkgs;[
    blender-hip
  ];

  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];
  # boot.initrd.kernelModules = [ "amdgpu" ]; # This should maybe be better in hardware.
}
