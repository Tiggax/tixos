{ pkgs, lib, config, ... }:
let
  cfg = config.mymod.modeling.blender;
in
{

  options.mymod.modeling.blender = {
    enable = lib.mkEnableOption "Enable Blender";
    hip = lib.mkOption {
      type = lib.types.bool;
      description = "Enable HIP support";
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs;[
      (blender.override {rocmSupport = cfg.hip;})
    ];
  };
}
