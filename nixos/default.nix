{ hostName, ... }:
{
  imports = [
    ./users.nix
    ./fonts.nix

    ./system/boot.nix
    ./system/audio.nix
    ./system/input.nix
    ./system/graphics.nix
    ./system/localization.nix

    ./programs/utilities.nix
    ./programs/hyprland.nix
    ./programs/steam.nix
    ./programs/ly.nix
    ./programs/nh.nix
  ];

  system.stateVersion = "24.11";
  networking.hostName = hostName;
  environment.defaultPackages = [ ];

  nix.settings = {
    auto-optimise-store = true;
    experimental-features = "nix-command flakes";
  };
}
