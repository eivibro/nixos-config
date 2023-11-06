{ inputs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;

    enableNvidiaPatches = true;
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
          kb_layout = no,no
          kb_variant = dvorak,
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
	  blur {
              enabled = true
	      ignore_opacity = true
              size = 3
              passes = 1
	  }
      
          drop_shadow = true
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

      # Switch keyboard variant
      bind = $mainMod, T, exec, hyprctl switchxkblayout at-translated-set-2-keyboard next

    '';
  };
}
