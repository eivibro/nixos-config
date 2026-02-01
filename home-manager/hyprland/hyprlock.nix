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
      background = 
      {
        #path = "screenshot";
        blur_passes = 3;
        blur_size = 6;
      };
      input-field = 
      {
        size = "200, 50";
        position = "0, -80";
        monitor = "";
        dots_center = true;
        fade_on_empty = false;
        outline_thickness = 5;
        placeholder_text = ''<span foreground="##${config.stylix.base16Scheme.base0F}">Password...</span>'';
        shadow_passes = 2;
      };

      label =
      [
        {
          text = ''cmd[update:1000] echo "<span foreground='##${config.stylix.base16Scheme.base0F}'>$(date "+%H:%M")</span>"'';
          font_size = 96;
          position = "0, 120";
          halign = "center";
          valign = "center";
        }
        
        {
          text = ''cmd[update:60000] echo "<span foreground='##${config.stylix.base16Scheme.base0F}'>$(date "+%A, %d %B")</span>"'';
          font_size = 28;
          position = "0, 40";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
