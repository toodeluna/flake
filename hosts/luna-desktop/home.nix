{ ... }:
{
  imports = [ ../../modules/home-manager ];

  home.stateVersion = "23.05";

  profile = {
    username = "luna";
    fullName = "Luna Heyman";
    email = "luna.heyman@proton.me";
  };

  monitors = [
    {
      name = "DP-4";
      primary = true;
    }
    {
      name = "DP-2";
      location = {
        position = "left-of";
        name = "DP-4";
      };
    }
  ];
}
