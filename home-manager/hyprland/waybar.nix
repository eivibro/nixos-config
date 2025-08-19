{pkgs, inputs, config, ...}:
{
  programs.waybar = {
    enable = true;
    settings = [{
      layer = "top";
      positon = "top";
      mode = "dock";
      exclusive = "true";
      passthrough = "true";
      gtk-layer-shell = true;
      modules-left = [ "clock" "hyprland/workspaces" ];
      modules-center = [ "hyprland/window" ];
      modules-right = [ "battery" "custom/power" "backlight" "tray" "pulseaudio" ];
      "backlight" = {
        format = "{icon} {percent}%";
        format-icons = [""];
        on-scroll-up = "brightnessctl set 1%+";
        on-scroll-down = "brightnessctl set 1%-";
        min-length = 6;
      };
      "battery" = {
        bat = "BAT0";
        states = {
          "warning" = 30;
          "critical" = 15;
        };
        format = "{icon} {capacity}%  {power:.1f} W";
        format-icons = ["" "" "" "" ""];
        format-charging = "  {capacity}%";
        format-plugged = "  {capacity}%";
        format-alt = "{time} {icon}";
      };
  
      "clock" = {
        format = "  {:%R    %d/%m}";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        calendar-weeks-pos = "right";
        format-calendar-weeks = "<span color='#99ffdd'><b>W{:%V}</b></span>";
      };
  
      "hyprland/window" = {
        format = "{}";
        seperate-outputs = true;
      };
  
      "pulseaudio" = {
        format = "{icon}  {volume}%";
        format-icons = ["" "" ""];
        min-length = 7;
      };	
      "hyprland/workspaces" = {
        on-click = "activate";
      };
    }];
    style = 
    ''
      * {
          border: none;
          border-radius: 0;
          font-family: Cartograph CF Nerd Font, monospace;
          font-weight: bold;
          font-size: 14px;
          min-height: 0;
      }
      
      window#waybar {
          background-color: transparent;
          /*background: rgba(21, 18, 27, 0);*/
          /*color: #cdd6f4;*/
      }

      window#waybar.hidden {
          background-color: transparent;
      }
      
      tooltip {
          background: #1e1e2e;
          border-radius: 10px;
          border-width: 2px;
          border-style: solid;
          border-color: #11111b;
      }
      
      #workspaces button {
          padding: 5px;
          color: #${config.stylix.base16Scheme.base04};
          margin-right: 5px;
      }
      
      #workspaces button.active {
          color: #${config.stylix.base16Scheme.base05};
      }
      
      #workspaces button.focused {
          color: #${config.stylix.base16Scheme.base07};
          background: #eba0ac;
          border-radius: 10px;
      }
      
      #workspaces button.urgent {
          color: #11111b;
          background: #a6e3a1;
          border-radius: 10px;
      }
      
      #workspaces button:hover {
          background: #11111b;
          color: #cdd6f4;
          border-radius: 10px;
      }
      
      #custom-language,
      #custom-updates,
      #custom-caffeine,
      #custom-weather,
      #window,
      #clock,
      #battery,
      #pulseaudio,
      #network,
      #workspaces,
      #tray,
      #backlight {
          background: #1e1e2e;
          padding: 0px 10px;
          margin: 3px 0px;
          margin-top: 10px;
          border: 1px solid #181825;
      }
      
      #tray {
          border-radius: 10px;
          margin-right: 10px;
      }
      
      #workspaces {
          background: #1e1e2e;
          border-radius: 10px;
          margin-left: 10px;
          padding-right: 0px;
          padding-left: 5px;
      }
      
      #custom-caffeine {
          color: #89dceb;
          border-radius: 10px 0px 0px 10px;
          border-right: 0px;
          margin-left: 10px;
      }
      
      #custom-language {
          color: #f38ba8;
          border-left: 0px;
          border-right: 0px;
      }
      
      #custom-updates {
          color: #f5c2e7;
          border-radius: 10px 0px 0px 10px;
          border-left: 0px;
          border-right: 0px;
      }
      
      #window {
          border-radius: 10px;
          margin-left: 60px;
          margin-right: 60px;
      }
      
      #clock {
          color: #fab387;
          color: #${config.stylix.base16Scheme.base07};
          border-radius: 10px 0px 0px 10px;
          margin-left: 5px;
          border-right: 0px;
      }
      
      #network {
          color: #f9e2af;
          border-left: 0px;
          border-right: 0px;
      }
      
      #pulseaudio {
          color: #${config.stylix.base16Scheme.base05};
          border-left: 0px;
          border-right: 0px;
      }
      
      #pulseaudio.microphone {
          color: #cba6f7;
          border-radius: 0px 10px 10px 0px;
          border-left: 0px;
          border-right: 0px;
          margin-right: 5px;
      }
      
      #battery {
          color: #${config.stylix.base16Scheme.base0C};
          border-radius: 0 10px 10px 0;
          margin-right: 10px;
          border-left: 0px;
      }

      #power {
        color: #${config.stylix.base16Scheme.base09};
        border-left: 0px;
        border-right: 0px;
        margin-right: 10px;
        border-radius: 0px 10px 10px 0;
        background: #1e1e2e;
        padding: 0px 10px;
      }      

      #custom-weather {
          border-radius: 0px 10px 10px 0px;
          border-right: 0px;
          margin-left: 0px;
      }
    '';
  };
}
