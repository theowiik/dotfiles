{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/boot.nix
    ./modules/desktop.nix
    ./modules/fonts.nix
    ./modules/services.nix
  ];

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
  # Users
  # ===========================
  users.users.oet = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };

  # Enable ZSH system-wide (required for user shell)
  programs.zsh.enable = true;

  # ===========================
  # System Packages
  # ===========================
  environment.systemPackages = with pkgs; [
    # System utilities
    git
    vim
    arandr

    # CLI tools needed system-wide
    zsh
    claude-code
  ];

  # ===========================
  # System Version
  # ===========================
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. Don't change this when upgrading!
  system.stateVersion = "25.11";
}
