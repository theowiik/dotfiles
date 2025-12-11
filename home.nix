{ config, pkgs, ... }:

{
  # ===========================
  # Home Manager Configuration
  # ===========================
  home.username = "oet";
  home.homeDirectory = "/home/oet";
  home.stateVersion = "25.11";

  # ===========================
  # User Packages
  # ===========================
  home.packages = with pkgs; [
    # Add user-specific packages here
    htop
    ripgrep
    fd
    bat
    eza
  ];

  # ===========================
  # Dotfiles Management
  # ===========================
  home.file = {
    # Example: Hyprland config
    # ".config/hypr/hyprland.conf".source = ./dotfiles/hypr/hyprland.conf;
  };

  # ===========================
  # Git Configuration
  # ===========================
  programs.git = {
    enable = true;
    userName = "Theo";
    userEmail = "your@email.com";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };

  # ===========================
  # Shell Configuration
  # ===========================
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#nixos";
      ll = "eza -l";
      la = "eza -la";
      ".." = "cd ..";
      "..." = "cd ../..";
      "dev-nixos" = "sudo chown -R oet:users /etc/nixos";
      "dev-nixos-exit" = "sudo chown -R root:root /etc/nixos";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "z"
      ];
      theme = "robbyrussell";
    };
  };

  # ===========================
  # Hyprland Configuration
  # ===========================
  # wayland.windowManager.hyprland = {
  #   enable = true;
  #   settings = {
  #     # Your Hyprland config here
  #   };
  # };

  # ===========================
  # Let Home Manager manage itself
  # ===========================
  programs.home-manager.enable = true;
}
