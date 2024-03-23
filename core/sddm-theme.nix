{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "Kangie";
    repo = "sddm-sugar-candy";
    rev = "a1fae5159c8f7e44f0d8de124b14bae583edb5b8";
    hash = "sha256-p2d7I0UBP63baW/q9MexYJQcqSmZ0L5rkwK3n66gmqM=";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
  '';
}
