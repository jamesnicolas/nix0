# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
  ];

  # TODO: Set your username
  home = {
    username = "nicolas9";
    homeDirectory = lib.mkForce "/home/nicolas9";
  };
  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  home.packages = [ 
    pkgs.mpv 
    pkgs.davinci-resolve-studio
    pkgs.discord
    pkgs.gimp
    pkgs.go
    pkgs.ripgrep
    pkgs.zig
    pkgs.wl-clipboard
    pkgs.obsidian
  ];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
