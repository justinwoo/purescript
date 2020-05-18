{ pkgs ? import ./pinned.nix {} }:
let
  dynamic-linker = pkgs.stdenv.cc.bintools.dynamicLinker;
  buildInputs = [ pkgs.gmp pkgs.zlib pkgs.ncurses5 pkgs.stdenv.cc.cc.lib ];
  libPath = pkgs.lib.makeLibraryPath buildInputs;
in
pkgs.mkShell {
  buildInputs = buildInputs;
  shellHook = ''
    export LIBRARY_PATH=${libPath}
  '';
}
