{ config, pkgs, ... }:

{
  # ===========================
  # Display Server & Desktop
  # ===========================
  services.xserver = {
    enable = true;
    xkb.layout = "se";
  };

  # Display Manager
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  # Hyprland Window Manager
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };
}
