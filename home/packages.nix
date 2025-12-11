{ config, pkgs, ... }:

{
  # ===========================
  # User Packages
  # ===========================
  home.packages = with pkgs; [
    # CLI Tools
    htop
    ripgrep
    bat
    fd
    eza
    neofetch
    tree
    cowsay

    # Editors & Development
    vscode
    vim
    micro
    helix

    # Browsers
    firefox

    # Hyprland & Wayland Tools
    foot # Terminal
    waybar # Status bar
    wofi # Application launcher
    dunst # Notifications
    grim # Screenshot tool
    slurp # Screen area selector
    wl-clipboard # Wayland clipboard utilities
    swaylock # Screen locker
    hyprpaper # Wallpaper manager
    wlsunset # Blue light filter
    brightnessctl # Brightness control
    playerctl # Media control
  ];
}
