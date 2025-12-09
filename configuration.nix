{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # ===========================
  # Boot Configuration
  # ===========================
  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
  };

  # ===========================
  # Networking
  # ===========================
  networking.hostName = "nixos";

  # ===========================
  # Localization
  # ===========================
  time.timeZone = "Europe/Stockholm";
  console.keyMap = "sv-latin1";

  # ===========================
  # Nix Configuration
  # ===========================
  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

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

  # ===========================
  # Users
  # ===========================
  users.users.oet = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };

  # ===========================
  # Shell Configuration
  # ===========================
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [
        "git"
        "z"
      ];
      theme = "robbyrussell";
    };
  };

  # ===========================
  # Fonts
  # ===========================
  fonts.packages = with pkgs; [
    font-awesome
    nerd-fonts._0xproto
    nerd-fonts.fira-code
  ];

  # ===========================
  # System Packages
  # ===========================
  environment.systemPackages = with pkgs; [
    arandr

    # Editors & Development
    vscode
    vim
    git

    # Shell & CLI Tools
    zsh
    neofetch
    claude-code

    # Browsers
    firefox

    # Hyprland & Wayland Essentials
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

  # ===========================
  # Services
  # ===========================

  # VMware Guest Support
  virtualisation.vmware.guest.enable = true;

  # SSH Server
  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = true;
  };

  # ===========================
  # System Version
  # ===========================
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. Don't change this when upgrading!
  system.stateVersion = "25.11";
}
