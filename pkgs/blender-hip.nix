{ pkgs, ... }:
{
  users.users.tiggax.extraGroups = [ "render" "video" ];

  environment.systemPackages = with pkgs;[
    blender-hip
  ];

  # boot.initrd.kernelModules = [ "amdgpu" ]; # This should maybe be better in hardware.
  hardware.opengl.extraPackages = with pkgs; [
    rocm-opencl-icd
    rocm-opencl-runtime
  ];
}
