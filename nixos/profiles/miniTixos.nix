{
  config,
  pkgs,
  modulesPath,
  userSettings,
  ...
}:
{
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
    ../../pkg-modules
    ../../development
    ../../machines/base.nix
  ];

  nixpkgs.hostPlatform = "x86_64-linux";

  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = userSettings.username;

  networking.hostName = "miniTixos";

  development = {
    helix.enable = true;
    enable = true;
    rstudio.enable = false;
    rust.enable = false;
  };

  mymod = {
    openssh.enable = true;
    kde.enable = true;
  };

}
