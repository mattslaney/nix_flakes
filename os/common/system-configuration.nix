{ config, pkgs, ... }:

{

  # System packages
  environment.systemPackages = with pkgs; [
    alacritty
    vim
    tmux
    git
    wget
    gcc
    gnumake
    unstable.cargo
    unstable.rustc
    unstable.rustfmt
    unstable.rust-analyzer
    curl
    ripgrep
    sysstat
    # for hyprland
    waybar
    mako
    libnotify
    swww
    rofi-wayland
    hyprpaper
    brightnessctl
  ];

  # System Fonts
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];
}

