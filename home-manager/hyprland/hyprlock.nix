{ inputs, config, ... }:
{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = [
        {
	  disable_loading_bar = true;
	  hide_cursor = true;
	}
      ];
      background = [
        {
          path = "screenshot";
          blur_passes = 3;
          blur_size = 6;
        }
      ];
      input-field = [
        {
          size = "200, 50";
          position = "0, -80";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          font_color = "rgb(${config.stylix.base16Scheme.base05})";
          inner_color = "rgb(${config.stylix.base16Scheme.base00})";
          outer_color = "rgb(${config.stylix.base16Scheme.base01})";
          fail_color = "rgb(${config.stylix.base16Scheme.base08})";
	  check_color = "rgb(${config.stylix.base16Scheme.base09})";
          outline_thickness = 5;
          placeholder_text = ''<span foreground="##${config.stylix.base16Scheme.base05}">Password...</span>'';
          shadow_passes = 2;
        }
      ];
    };
  };
}
