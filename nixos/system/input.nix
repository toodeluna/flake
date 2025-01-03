{
  console.useXkbConfig = true;
  security.sudo.extraConfig = "Defaults env_reset,pwfeedback";

  services.xserver.xkb = {
    layout = "us";
    options = "caps:escape";
  };
}
