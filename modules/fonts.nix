{ config, pkgs, ... }:

{
  # ===========================
  # Fonts
  # ===========================
  fonts.packages = with pkgs; [
    font-awesome
    nerd-fonts._0xproto
    nerd-fonts.fira-code
  ];
}
