{pkgs, lib, config, ...}: 
let
  cfg = config.mymod.modeling.freecad;
in
{
  imports = [];

  options.mymod.modeling.freecad = {
    enable = lib.mkEnableOption "Enable FreeCAD";
    
  };

  config = lib.mkIf cfg.enable {

    environment.systemPackages = with pkgs; [
      freecad
    ];
  };
}
