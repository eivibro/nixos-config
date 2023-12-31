{pkgs, inputs, ...}:
{
  programs.waybar = {
    enable = true;
    #package = inputs.hyprland.packages.x86_64-linux.waybar-hyprland;
    package = pkgs.waybar;
    settings = [{
      layer = "top";
      positon = "top";
      mode = "dock";
      exclusive = "true";
      passthrough = "false";
      gtk-layer-shell = true;
      modules-left = [ "clock" "hyprland/workspaces" ];
      modules-center = [ "hyprland/window" ];
      modules-right = [ "battery" "backlight" "pulseaudio" ];
      "backlight" = {
        #device = "intel_backlight";
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
        format = "{icon}  {capacity}%";
        format-icons = ["" "" "" "" ""];
        format-charging = "  {capacity}%";
        format-plugged = "  {capacity}%";
        format-alt = "{time} {icon}";
      };
  
      "clock" = {
        format = "{:  %R    %d/%m}";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        calendar-weeks-pos = "right";
        format-calendar-weeks = "<span color='#99ffdd'><b>W{:%V}</b></span>";
      };
  
      #Fix hyprland/window how?
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
          background: rgba(21, 18, 27, 0);
          color: #cdd6f4;
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
          color: #313244;
          margin-right: 5px;
      }
      
      #workspaces button.active {
          color: #a6adc8;
      }
      
      #workspaces button.focused {
          color: #a6adc8;
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
          color: #89b4fa;
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
          color: #a6e3a1;
          border-radius: 0 10px 10px 0;
          margin-right: 10px;
          border-left: 0px;
      }
      
      #custom-weather {
          border-radius: 0px 10px 10px 0px;
          border-right: 0px;
          margin-left: 0px;
      }
    '';
  };
}