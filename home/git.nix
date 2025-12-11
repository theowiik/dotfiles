{ config, pkgs, ... }:

{
  # ===========================
  # Git Configuration
  # ===========================
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "theowiik";
        email = "theo.le.wiik@gmail.com";
      };
      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };
}
