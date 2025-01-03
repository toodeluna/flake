{ pkgs, ... }:
{
  services.pipewire = {
    enable = true;
    jack.enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

  environment.systemPackages = with pkgs; [
    ncpamixer
  ];
}
