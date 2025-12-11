{ config, pkgs, ... }:

{
  # ===========================
  # Boot Configuration
  # ===========================
  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
  };
}
