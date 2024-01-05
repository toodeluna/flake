{ pkgs, ... }:
{
  services.picom = {
    enable = true;
    package = import ../../packages/compfy.nix { inherit pkgs; };
    backend = "glx";
    vSync = true;
  };
}
