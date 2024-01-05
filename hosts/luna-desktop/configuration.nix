{ pkgs, config, ... }:
{
  imports = [ ./hardware-configuration.nix ../../modules/nixos ];

  enable-nvidia = true;

  system.stateVersion = "23.11";
  networking.hostName = "luna-desktop";
  time.timeZone = "Europe/Brussels";
  i18n.defaultLocale = "en_US.UTF-8";

  users.users.luna = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
}
