{ config, pkgs, ... }:

{
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
}
