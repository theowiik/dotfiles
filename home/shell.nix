{ config, pkgs, ... }:

{
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
      "nix-os" = "cd /etc/nixos";
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
}
