{ inputs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$mainMod" = "SUPER";
      monitor = [
        "DP-3,2560x1440@144,0x0,1"
	#"HDMI-A-1,3840x2160@60,1920x0,1,bitdepth,10,cm,hdr,sdrbrightness,1.2,sdrsaturation,0.98"
        "Unknown-1,disable"
      ];
      exec-once = [
        "waybar"
	"wpaperd -d"
      ];

      bind = [
        "$mainMod, Q, exec, kitty"
        "$mainMod SHIFT, M, exit," 
        "$mainMod, B, exec, firefox"
        "$mainMod, C, killactive, "
        "$mainMod, F, fullscreen, "
        "$mainMod, V, togglefloating, "
        "$mainMod, D, exec, tofi-drun --drun-launch=true" 
        "$mainMod SHIFT, D, exec, tofi-run | xargs hyprctl dispatch exec" 
        "$mainMod, P, pseudo,"
        "$mainMod SHIFT, L, exit, swaylock-fancy" 

	# Cycle focus through windows
        "$mainMod CONTROL, l, cyclenext"
        #"$mainMod CONTROL, h, cycleprev"
      
        # Move focus with mainMod + arrow keys
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
      
        # Move focus with mainMod + vim keys
        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, J, movefocus, u"
        "$mainMod, K, movefocus, d"
      
        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        "$mainMod, TAB,workspace, previous"
      
        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
        "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
        "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
        "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
        "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
        "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
        "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
        "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
        "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
        "$mainMod SHIFT, 0, movetoworkspacesilent, 10"
      
        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        # Media Keys
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle "

        # Brightness
        ",XF86MonBrightnessDown, exec, brightnessctl set 5%-"
        ",XF86MonBrightnessUp, exec, brightnessctl set +5%"

        # Pinning window
        "$mainMod, S, pin"

        # Switch keyboard variant
        "$mainMod, T, exec, hyprctl switchxkblayout at-translated-set-2-keyboard next"
        #"$mainMod, T, exec, hyprctl switchxkblayout lite-on-technology-corp.-hp-basic-usb-keyboard next"
      ];

      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      decoration = {
        rounding = 10;
	blur = {
            enabled = true;
	    ignore_opacity = true;
            size = 3;
            passes = 1;
	};
	shadow = {
	  enabled = true;
          range = 4;
          render_power = 3;
	};
      };


      windowrulev2 = [
        "move 75% 70%,class:(mpv)"
        "float,title:(Picture-in-Picture)"
        "move 67% 66%,title:(Picture-in-Picture)"
        "size 30% 30%,title:(Picture-in-Picture)"
        "noinitialfocus,class:(mpv)"
        "float,class:(mpv)"
      ];

      env = [ 
        "XCURSOR_SIZE, 16"
      ];

      input = {
        kb_layout = "no,no";
        kb_variant = ",dvorak";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = true;
          tap-to-click = false;
        };
        sensitivity = 0;
        resolve_binds_by_sym = true;
      };

      device = [
        {
          name = "zmk-project-broxboard-keyboard";
          kb_layout = "no";
	}
	{
          name = "broxboard-keyboard";
          kb_layout = "no";
	}
      ];

      general = {
        gaps_in = 5;
        gaps_out = 5;
        border_size = 2;
        layout = "dwindle";
      };

      misc = {
          force_default_wallpaper = 0;
      };

      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [ 
	  "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
	];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
    };
  };
}
