{ pkgs, lib, config, ...}:
let
  cfg = config.mymod.modeling.printing;
in 
{
  imports = [ ];

  options.mymod.modeling.printing = {
    enable = lib.mkEnableOption "Enable 3d printing environment";
    lychee = {
      enable = lib.mkEnableOption "Enable Lychee Slicer";
    };
  };

  config = 
  let 
    lychee = pkgs.callPackage ./lychee.nix {}; 
  in lib.mkIf cfg.enable {
      
      environment.systemPackages = with pkgs; [
        (if cfg.lychee.enable then lychee else null)
          ];
  };
  
}
