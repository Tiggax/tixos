{ pkgs, ... }:
{
  users.users.tiggax.extraGroups = [ "render" "video" ];

  environment.systemPackages = with pkgs;[
    blender-hip
  ];
}