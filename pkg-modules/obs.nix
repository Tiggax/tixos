
{pkgs, lib, config, ...}:
let
    cfg = config.mymod.obs;
in 
{
    imports = [
    ];

    options.mymod.obs = {
        enable = lib.mkEnableOption "Enable the OBS";
    };

    config = lib.mkIf cfg.enable {

        environment.systemPackages = [
          (pkgs.wrapOBS {
            plugins = with pkgs.obs-studio-plugins; [
              wlrobs
              obs-backgroundremoval
              obs-pipewire-audio-capture
            ];
          })
        ];
    
        boot.extraModulePackages = with config.boot.kernelPackages; [
            v4l2loopback
        ];
        boot.extraModprobeConfig = ''
            options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
        '';
        security.polkit.enable = true;
    };
    
}
