{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    rustc
    cargo
    gcc
    rustfmt
    clippy
    rust-analyzer
    lldb
  ];
}