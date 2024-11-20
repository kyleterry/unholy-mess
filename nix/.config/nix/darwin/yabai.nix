{ ... }: {
  services.yabai = {
    enable = false;
    config = {
      layout = "stack";
      auto_balance = "off";

      mouse_modifier = "alt";
      # set modifier + right-click drag to resize window (default: resize)
      mouse_action2 = "resize";
      # set modifier + left-click drag to resize window (default: move)
      mouse_action1 = "move";

      # gaps
      #top_padding = 0;
      #bottom_padding = 0;
      #left_padding = 0;
      #right_padding = 0;
      #window_gap = 0;
    };
    extraConfig = ''
      # bar configuration
      #yabai -m signal --add event=window_focused   action="sketchybar --trigger window_focus"
      #yabai -m signal --add event=window_created   action="sketchybar --trigger windows_on_spaces"
      #yabai -m signal --add event=window_destroyed action="sketchybar --trigger windows_on_spaces"


      # rules
      yabai -m rule --add app="^System Settings$"    manage=off
      yabai -m rule --add app="^System Information$" manage=off
      yabai -m rule --add app="^System Preferences$" manage=off
      yabai -m rule --add title="Preferences$"       manage=off
      yabai -m rule --add title="Settings$"          manage=off

      # workspace management
      yabai -m space 1  --label web
      yabai -m space 2  --label productive
      yabai -m space 3  --label chat
      yabai -m space 4  --label utils
      yabai -m space 5  --label code

      # assign apps to spaces
      yabai -m rule --add app="Firefox" space=web

      yabai -m rule --add app="kitty" space=productive

      # yabai -m rule --add app="Microsoft Teams" space=chat
      yabai -m rule --add app="Slack" space=chat
      # yabai -m rule --add app="Signal" space=chat
      # yabai -m rule --add app="Messages" space=chat

      yabai -m rule --add app="Music" space=utils
      yabai -m rule --add app="Bitwarden" space=utils
    '';
  };
}
