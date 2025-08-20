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
          font-family: monospace;
          font-weight: bold;
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
      
      #workspaces button label {
          font-size: 12px;
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
      
      #window,
      #clock,
      #battery,
      #pulseaudio,
      #workspaces,
      #tray,
      #backlight {
          font-size: 12px;
          background: #1e1e2e;
          border-radius: 10px;
          margin: 3px 0px;
          margin-top: 5px;
          border: 1px solid #181825;
      }
      
      #tray {
          border-radius: 10px;
          margin-right: 10px;
          margin-left: 10px;
      }
      
      #workspaces {
          background: #1e1e2e;
          border-radius: 10px;
          margin-left: 10px;
          padding-right: 0px;
          padding-left: 5px;
      }
      
      #window {
          border-radius: 10px;
          margin-left: 60px;
          margin-right: 60px;
      }
      
      #clock {
          color: #fab387;
          color: #${config.stylix.base16Scheme.base07};
          border-radius: 10px;
          margin-left: 5px;
          border-right: 0px;
      }
      
      #pulseaudio {
          color: #${config.stylix.base16Scheme.base05};
          border-left: 0px;
          border-right: 0px;
      }
      
      #pulseaudio.microphone {
          color: #cba6f7;
          border-radius: 10px;
          border-left: 0px;
          border-right: 0px;
          margin-right: 5px;
      }
      
      #battery {
          color: #${config.stylix.base16Scheme.base0C};
          border-radius: 10px;
          margin-right: 10px;
          border-left: 0px;
      }

    '';
  };
}
