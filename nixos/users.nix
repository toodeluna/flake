{
  pkgs,
  config,
  theme,
  ...
}:
{
  programs.fish.enable = true;

  users = {
    defaultUserShell = pkgs.fish;

    users.luna = {
      isNormalUser = true;
      description = "Luna Heyman";
      shell = pkgs.fish;
      extraGroups = [ "wheel" ];
    };
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "hmbackup";

    extraSpecialArgs = {
      inherit theme;
      systemConfiguration = config;
    };

    users.luna.imports = [ ../home ];
  };
}
