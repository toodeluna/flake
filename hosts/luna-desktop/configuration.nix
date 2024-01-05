{ pkgs, config, ... }:
{
  imports = [ ./hardware-configuration.nix ];

  system.stateVersion = "23.11";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  networking.hostName = "luna-desktop";
  time.timeZone = "Europe/Brussels";
  i18n.defaultLocale = "en_US.UTF-8";

  console.useXkbConfig = true;

  sound.enable = true;

  security.sudo.extraConfig = "Defaults env_reset,pwfeedback";

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
  };

  users.users.luna = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
    libinput.enable = true;
    displayManager.startx.enable = true;

    xkb = {
      layout = "us";
      options = "caps:escape";
    };

    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
    };
  };

  fonts.packages = with pkgs; [
    work-sans
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

  environment.systemPackages = with pkgs; [
    git
    neovim
    alacritty
    firefox
    rofi
  ];
}
