{ pkgs, ... }:{
  environment.systemPackages = with pkgs; [
    glaxnimate
    libsForQt5.kdenlive
  ];
}