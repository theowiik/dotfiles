{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  programs.hyprland = {
    enable = true;
    withUWSM = true; # recommended for most users
    xwayland.enable = true; # Xwayland can be disabled.
  };

  networking.hostName = "nixos";
  time.timeZone = "Europe/Stockholm";

  console.keyMap = "sv-latin1";

  nixpkgs.config.allowUnfree = true;

  services.xserver = {
    enable = true;
    xkb.layout = "se";
  };

  # services.xserver.desktopManager.xfce.enable = true;
  # services.xserver.displayManager.lightdm.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  users.users.oet = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

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

  users.extraUsers.oet = {
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    vscode
    neofetch
    git
    firefox
    kitty
    foot
    vim
    zsh
  ];

  virtualisation.vmware.guest.enable = true;

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = true;
  };

  system.stateVersion = "25.11";
}
