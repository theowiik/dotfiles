{ config, pkgs, ... }:

{
  imports = [
    ./home/packages.nix
    ./home/shell.nix
    ./home/git.nix
    ./home/hyprland.nix
  ];

  # ===========================
  # Home Manager Configuration
  # ===========================
  home.username = "oet";
  home.homeDirectory = "/home/oet";
  home.stateVersion = "25.11";

  # ===========================
  # Dotfiles Management
  # ===========================
  home.file = {
    # Example: Additional dotfiles can be managed here
    # ".config/foo/config.conf".source = ./dotfiles/foo/config.conf;
  };

  # ===========================
  # Let Home Manager manage itself
  # ===========================
  programs.home-manager.enable = true;
}
