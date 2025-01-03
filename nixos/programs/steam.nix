{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.modules.programs.steam.enable = lib.mkEnableOption "steam";

  config = lib.mkIf config.modules.programs.steam.enable {
    programs.gamemode.enable = true;

    programs.steam = {
      enable = true;
      extraCompatPackages = [ pkgs.proton-ge-bin ];
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };

    environment.systemPackages = with pkgs; [
      r2modman
    ];
  };
}
