{ config, pkgs, ... }:

{
  users.users.matt = {
    isNormalUser = true;
    description = "matt";
    extraGroups = [ "networkmanager" "wheel" "wireshark" ];
    packages = with pkgs; [
      firefox
      neovim
      vscode
      unstable.obsidian
      wireshark
    ];
  };
}

