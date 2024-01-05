{ ... }:
{
  imports = [ ../../modules/home-manager ];

  home.stateVersion = "23.05";

  profile = {
    username = "luna";
    fullName = "Luna Heyman";
    email = "luna.heyman@proton.me";
  };
}
