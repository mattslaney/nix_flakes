{ config, pkgs, ... }:

{

  # System packages
  environment.systemPackages = with pkgs; [
    alacritty
    vim
    tmux
    git
    wget
    curl
    ripgrep
    # for hyprland
    waybar
    mako
    libnotify
    swww
    rofi-wayland
  ];
}

