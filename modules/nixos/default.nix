{ pkgs, config, lib, ... }:
let
  inherit (lib) mkIf mkOption types;
in
{
  options = {
    enable-nvidia = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nixpkgs.config.allowUnfree = true;

    console.useXkbConfig = true;
    sound.enable = true;
    security.sudo.extraConfig = "Defaults env_reset,pwfeedback";

    programs.fish.enable = true;
    users.defaultUserShell = pkgs.fish;

    boot.loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    hardware.opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };

    hardware.nvidia = mkIf config.enable-nvidia {
      modesetting.enable = true;
      open = false;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    hardware.pulseaudio = {
      enable = true;
      support32Bit = true;
    };

    services.xserver = {
      enable = true;
      videoDrivers = mkIf config.enable-nvidia [ "nvidia" ];
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
  };
}
