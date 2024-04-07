{ config, pkgs, ... }:

{
  users.users.matt = {
    isNormalUser = true;
    description = "matt";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      neovim
      unstable.obsidian
    ];
  };
}

