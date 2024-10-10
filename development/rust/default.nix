{ pkgs, lib, config, ... }:
let
  cfg = config.development.rust;
in
{
  options.development.rust = {
    enable = lib.mkEnableOption "Enable Rust Dev";
  };

  config = lib.mkIf cfg.enable {

    environment.systemPackages = with pkgs; [
      rustc
      cargo
      gcc
      rustfmt
      clippy
      rust-analyzer
      lldb
    ];

  };
}