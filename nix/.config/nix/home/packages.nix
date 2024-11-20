{ lib, pkgs, ... }: with lib; {
  home.packages = with pkgs; [
    glances
    jq
    racket
    gambit
    zig
    zls
    p4
    SDL2
  ];
}
