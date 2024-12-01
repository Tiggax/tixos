{pkgs, lib, config, ...}:
let
  cfg = config.mymod.modeling;
in 
{
  imports = [
    ./blender.nix
    ./freecad.nix
    ./3Dprinting
  ];

  options.mymod.modeling = {
    enable = lib.mkEnableOption "Enable Modeling packages";
    
  };

  config = lib.mkIf cfg.enable {
    mymod.modeling = {
      freecad.enable = lib.mkDefault true;
      blender.enable = lib.mkDefault true;
      printing = {
        enable = lib.mkDefault true;
        lychee.enable = lib.mkDefault true;
      };
    };
  };
  
}
