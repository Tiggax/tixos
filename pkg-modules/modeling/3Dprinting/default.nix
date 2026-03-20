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
    orca-slicer = {
      enable = lib.mkEnableOption "Enable Orca Slicer";
    };
    snorca = {
      enable = lib.mkEnableOption "Enable SnOrca Slicer";
    };
  };

  config = 
  let 
    lychee = pkgs.callPackage ./lychee.nix {};
    snorca = pkgs.callPackage ./snorca.nix {};
  in lib.mkIf cfg.enable {
      
      environment.systemPackages = with pkgs; [
        (if cfg.lychee.enable then lychee else null)
        (if cfg.snorca.enable then snorca else null)
        (if cfg.orca-slicer.enable then orca-slicer else null)
      ];
  };
  
}
