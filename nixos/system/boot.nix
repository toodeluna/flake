{ pkgs, ... }:
{
  boot = {
    consoleLogLevel = 0;

    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];

    initrd = {
      verbose = false;
      kernelModules = [ "amdgpu" ];
    };

    loader = {
      timeout = 0;
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    plymouth = rec {
      enable = true;
      theme = "plymouth-gif-theme";
      themePackages = [ pkgs.${theme} ];
    };
  };
}
