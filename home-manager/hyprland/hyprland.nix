{ inputs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$mainMod" = "SUPER";
      monitor = ",preferred,auto,auto";
      exec-once = [
        "waybar"
	"wpaperd"
      ];

      bind = [
        "$mainMod, Q, exec, kitty"
        "$mainMod SHIFT, M, exit," 
        "$mainMod, B, exec, firefox"
        "$mainMod, C, killactive, "
        "$mainMod, F, fullscreen, "
        "$mainMod, V, togglefloating, "
        "$mainMod, D, exec, bemenu-run"
        "$mainMod, P, pseudo,"
        "$mainMod SHIFT, L, exit, swaylock-fancy" 
      
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
        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;
        #"col.shadow" = "rgba(1a1a1aee)";
      };


      windowrulev2 = [
        "move 75% 70%,class:(mpv)"
        "float,title:(Picture-in-Picture)"
        "move 67% 66%,title:(Picture-in-Picture)"
        "size 30% 30%,title:(Picture-in-Picture)"
        "noinitialfocus,class:(mpv)"
        "float,class:(mpv)"
      ];

      # Some default env vars.
      env = [ 
        "XCURSOR_SIZE, 24"
        "XCURSOR_THEME,Catppuccin-Frappe-Teal-Cursors"
      ];

      input = {
        kb_layout = "no,no";
        kb_variant = "dvorak,";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = true;
          tap-to-click = false;
        };
        sensitivity = 0;
      };

      "device:zmk-project-bro-board-keyboard" = {
        kb_layout = "no";
	kb_variant = "";
      };

      "device:bro-board-keyboard" = {
        kb_layout = "no";
	kb_variant = "";
      };

      "device:zmk-project-broxboard-keyboard" = {
        kb_layout = "no";
	kb_variant = "";
      };

      "device:broxboard-keyboard" = {
        kb_layout = "no";
	kb_variant = "";
      };

      "device:trackpoint" = {
        sensitivity = "-0.9";
      };

      general = {
        gaps_in = 5;
        gaps_out = 5;
        border_size = 2;
        #"col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        #"col.inactive_border" = "rgba(595959aa)";
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
      
      master = {
          new_is_master = true;
      };
      
      gestures = {
          workspace_swipe = false;
      };
      
      "device:epic-mouse-v1" = {
          sensitivity = "-0.5";
      };
    };
  };
}
