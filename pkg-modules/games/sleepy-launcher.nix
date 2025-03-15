{pkgs, lib, config, inputs, ...}: 
let
  cfg = config.mymod.games.sleepy-launcher;
in
{
  imports = [
    inputs.aagl.nixosModules.default
  ];
  
  options.mymod.games.sleepy-launcher = {
    enable = lib.mkEnableOption "Enable Sleepy Launcher (Zenless Zone Zero Launcher)";
  };
  
  config = lib.mkIf cfg.enable {
    
    nix.settings = inputs.aagl.nixConfig; # Set up Cachix
    programs.sleepy-launcher.enable = true;

  };
}
