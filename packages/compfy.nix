{ pkgs }:
pkgs.picom.overrideAttrs (oldAttrs: rec {
  pname = "compfy";
  version = "1.7.2";
  buildInputs = [ pkgs.pcre2 ] ++ oldAttrs.buildInputs;
  postInstall = "";
  src = pkgs.fetchFromGitHub {
    owner = "allusive-dev";
    repo = "compfy";
    rev = version;
    hash = "sha256-7hvzwLEG5OpJzsrYa2AaIW8X0CPyOnTLxz+rgWteNYY=";
  };
})
