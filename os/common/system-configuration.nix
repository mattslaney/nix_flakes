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
    hyprpaper
  ];

  # System Fonts
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];
}

