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
    cmake
    clang-tools
    unstable.cargo
    unstable.rustc
    unstable.rust-analyzer
    unstable.rustfmt
    python3
    nodejs_20
    nodePackages.typescript
    nodePackages.typescript-language-server
    curl
    ripgrep
    sysstat
    unzip
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

