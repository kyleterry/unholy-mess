{ lib, pkgs, ... }: with lib; {
  home.packages = with pkgs; [
    glances
    jq
    racket
    gambit
    zig
    zls
  ];
}
