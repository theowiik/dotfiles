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
    settings = {
      user = {
        name = "Theo";
        email = "your@email.com";
      };
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
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      # Monitor configuration
      monitor = ",preferred,auto,1";

      # Input configuration
      input = {
        kb_layout = "se";
        follow_mouse = 1;
      };

      # Variables
      "$terminal" = "foot";
      "$mainMod" = "SUPER";

      # Autostart applications
      exec-once = [
        "waybar"
        "dunst"
        "hyprpaper"
        "wlsunset"
      ];

      # Key bindings
      bind = [
        # Basic window management
        "$mainMod, Return, exec, $terminal"
        "$mainMod, Q, killactive"
        "$mainMod, M, exit"
        "$mainMod, V, togglefloating"
        "$mainMod, F, fullscreen"

        # Application launcher
        "$mainMod, D, exec, wofi --show drun"

        # Lock screen
        "$mainMod, L, exec, swaylock -f -c 000000"

        # Screenshots
        ", Print, exec, grim ~/Pictures/screenshot-$(date +%Y%m%d-%H%M%S).png"
        "SHIFT, Print, exec, grim -g \"$(slurp)\" ~/Pictures/screenshot-$(date +%Y%m%d-%H%M%S).png"

        # Brightness control
        ", XF86MonBrightnessUp, exec, brightnessctl set +5%"
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"

        # Media control
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"

        # Move focus
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # Switch workspaces
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"

        # Move window to workspace
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
      ];

      # Mouse bindings
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };

  # ===========================
  # Let Home Manager manage itself
  # ===========================
  programs.home-manager.enable = true;
}
