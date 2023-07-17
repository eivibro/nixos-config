{ config, pkgs, inputs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;

    extraConfig = ''
      monitor=,preferred,auto,auto
      
      
      # See https://wiki.hyprland.org/Configuring/Keywords/ for more
      
      # Execute your favorite apps at launch
      # exec-once = waybar & hyprpaper & firefox
      exec-once = waybar
      #exec-once = sleep 20 && hyprctl setcursor Bibata-Modern-Classic 40
      
      # Source a file (multi-file configs)
      # source = ~/.config/hypr/myColors.conf
      
      # Some default env vars.
      env = XCURSOR_SIZE, 24 
      #env = XCURSOR_THEME,Bibata-Modern-Classic
      env = XCURSOR_THEME,Catppuccin-Frappe-Teal-Cursors
      
      # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
      input {
          kb_layout = no
          kb_variant = dvorak
          kb_model =
          kb_options =
          kb_rules =
      
          follow_mouse = 1
      
          touchpad {
              natural_scroll = no
          }
      
          sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
      }
      
      general {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
      
          gaps_in = 5
          gaps_out = 5
          border_size = 2
          col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
          col.inactive_border = rgba(595959aa)
      
          layout = dwindle
      }
      
      decoration {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
      
          rounding = 10
          blur = yes
          blur_size = 3
          blur_passes = 1
          blur_new_optimizations = on
      
          drop_shadow = yes
          shadow_range = 4
          shadow_render_power = 3
          col.shadow = rgba(1a1a1aee)
      }
      
      animations {
          enabled = yes
      
          # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
      
          bezier = myBezier, 0.05, 0.9, 0.1, 1.05
      
          animation = windows, 1, 7, myBezier
          animation = windowsOut, 1, 7, default, popin 80%
          animation = border, 1, 10, default
          animation = borderangle, 1, 8, default
          animation = fade, 1, 7, default
          animation = workspaces, 1, 6, default
      }
      
      dwindle {
          # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
          pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
          preserve_split = yes # you probably want this
      }
      
      master {
          # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
          new_is_master = true
      }
      
      gestures {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
          workspace_swipe = off
      }
      
      # Example per-device config
      # See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
      device:epic-mouse-v1 {
          sensitivity = -0.5
      }
      
      device:trackpoint {
          sensitivity = -0.9
      }
      # Example windowrule v1
      # windowrule = float, ^(kitty)$
      # Example windowrule v2
      # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
      # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
      windowrulev2 = float,title:(Picture-in-Picture)
      windowrulev2 = move 67% 66%,title:(Picture-in-Picture)
      windowrulev2 = size 30% 30%,title:(Picture-in-Picture)
      windowrulev2 = noinitialfocus,class:(mpv)
      windowrulev2 = float,class:(mpv)
      windowrulev2 = move 75% 70%,class:(mpv)
      
      
      # See https://wiki.hyprland.org/Configuring/Keywords/ for more
      $mainMod = SUPER
      
      # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
      bind = $mainMod, Q, exec, kitty
      bind = $mainMod, B, exec, firefox
      bind = $mainMod, C, killactive, 
      bind = $mainMod, M, exit, 
      bind = $mainMod, F, fullscreen, 
      bind = $mainMod, E, exec, dolphin
      bind = $mainMod, V, togglefloating, 
      bind = $mainMod, D, exec, bemenu-run # dwindle
      bind = $mainMod, P, pseudo, # dwindle
      #bind = $mainMod, J, togglesplit, # dwindle
      
      # Move focus with mainMod + arrow keys
      bind = $mainMod, left, movefocus, l
      bind = $mainMod, right, movefocus, r
      bind = $mainMod, up, movefocus, u
      bind = $mainMod, down, movefocus, d
      
      # Move focus with mainMod + vim keys
      bind = $mainMod, H, movefocus, l
      bind = $mainMod, L, movefocus, r
      bind = $mainMod, J, movefocus, u
      bind = $mainMod, K, movefocus, d
      
      
      # Switch workspaces with mainMod + [0-9]
      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 10
      bind = $mainMod, TAB,workspace, previous
      
      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      bind = $mainMod SHIFT, 1, movetoworkspacesilent, 1
      bind = $mainMod SHIFT, 2, movetoworkspacesilent, 2
      bind = $mainMod SHIFT, 3, movetoworkspacesilent, 3
      bind = $mainMod SHIFT, 4, movetoworkspacesilent, 4
      bind = $mainMod SHIFT, 5, movetoworkspacesilent, 5
      bind = $mainMod SHIFT, 6, movetoworkspacesilent, 6
      bind = $mainMod SHIFT, 7, movetoworkspacesilent, 7
      bind = $mainMod SHIFT, 8, movetoworkspacesilent, 8
      bind = $mainMod SHIFT, 9, movetoworkspacesilent, 9
      bind = $mainMod SHIFT, 0, movetoworkspacesilent, 10
      
      # Scroll through existing workspaces with mainMod + scroll
      bind = $mainMod, mouse_down, workspace, e+1
      bind = $mainMod, mouse_up, workspace, e-1
      
      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow

      # Media Keys
      bind = ,XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+
      bind = ,XF86AudioLowerVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-
      bind = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
      bind = ,XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle 

      # Brightness
      bind=,XF86MonBrightnessDown, exec, brightnessctl set 5%-
      bind=,XF86MonBrightnessUp, exec, brightnessctl set +5%

      # Pinning window
      bind = $mainMod, S, pin

    '';
  };
   # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "eivbro";
  home.homeDirectory = "/home/eivbro";
  home.stateVersion = "23.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userEmail = "eivbro@gmail.com";
    userName = "eivibro";
  };

  programs.mpv = {
    enable = true;
    scripts = [ pkgs.mpvScripts.sponsorblock ];
   # package = pkgs.wrapMpv (pkgs.mpv-unwrapped.override { vapoursynthSupport = true; }) {
   #   youtubeSupport = true; };
    config = {
      geometry = "0%:0%";
      autofit-larger = "30%x30%";
      hwdec = "auto";
      ytdl-format="bestvideo[height<=?1080][vcodec!=?vp9]+bestaudio/best";

    };
  };

  programs.waybar = {
    enable = true;
    package = inputs.hyprland.packages.x86_64-linux.waybar-hyprland;
    settings = [{
      layer = "top";
      positon = "top";
      mode = "dock";
      exclusive = "true";
      passthrough = "false";
      gtk-layer-shell = true;
      modules-left = [ "clock" "wlr/workspaces" ];
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
      "wlr/workspaces" = {
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

  programs.firefox = {
    enable = true;
    package = pkgs.firefox.override {
      cfg = { enableTridactylNative = true; };
    };
    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;
	settings = {
          "browser.startup.homepage" = "https://duckduckgo.com";
	  "gfx.font_rendering.fontconfig.max_generic_substitutions" = 127;
	};
	extensions = with pkgs.nur.repos.rycee.firefox-addons; 
	[ 
	  ublock-origin 
	  #bypass-paywalls-clean
	  bitwarden
	  privacy-badger
	  clearurls
	  decentraleyes
	  duckduckgo-privacy-essentials
	  sponsorblock
	  unpaywall
	  demodal
	  h264ify
	  tridactyl
	];
      };
    };
  };
  # Packages to install
  home.packages = with pkgs; [
    htop
    ytfzf
    wlr-randr
    powertop
    yt-dlp
    tmux
    obsidian
    moonlight-qt
    jellyfin-media-player
    tor-browser-bundle-bin
  ];

  home.pointerCursor = {
    package = pkgs.catppuccin-cursors.frappeTeal;
    name = "Catppuccin-Frappe-Teal-Cursors";
    gtk.enable = true;
    size = 24;
    x11 = {
      enable = true;
      defaultCursor = "Catppuccin-Frappe-Teal-Cursors";
    };
  };

  gtk = {
    enable = true;
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;

    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
  };

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };
}
