{ lib, config, ... }:
let
  inherit (lib) mkOption types;
in
{
  options = {
    profile = mkOption {
      type = types.submodule {
        options = {
          username = mkOption {
            type = types.str;
            example = "luna";
          };
          fullName = mkOption {
            type = types.str;
            example = "Luna Heyman";
          };
          email = mkOption {
            type = types.str;
            example = "luna.heyman@proton.me";
          };
        };
      };
    };
  };

  config = with config.profile; {
    home.username = username;
    home.homeDirectory = "/home/${username}";
  };
}
