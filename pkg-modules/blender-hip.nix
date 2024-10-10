{ pkgs, ... }:
{
  # users.users.tiggax.extraGroups = [ "render" "video" ];

  environment.systemPackages = with pkgs;[
    blender-hip
  ];

  # hardware.opengl.extraPackages = with pkgs; [
  #   rocm-opencl-icd
  #   rocm-opencl-runtime
  # ];
}
