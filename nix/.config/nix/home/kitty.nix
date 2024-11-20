{ config, lib, pkgs, ... }: with lib; {
  programs.kitty = {
    enable = true;
    theme = "Gruvbox Material Dark Soft";

    font = {
      name = "Terminus (TTF)";
      size = 13.0;
    };

    settings = {
      tab_bar_edge = "top";
      confirm_os_window_close = 0;
      enable_audio_bell = "no";
      macos_option_as_alt = "yes";
      window_padding_width = "5";
    };

    shellIntegration = {
      mode = "enabled";
      enableZshIntegration = true;
    };
  };
}
