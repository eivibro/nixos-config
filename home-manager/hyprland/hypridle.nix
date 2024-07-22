{ inputs, ... }:
{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock-cmd = "pidof hyprlock || hyprlock";
	before_sleep_cmd = "hyprlock";
	ignore_dbus_inhibit = true;
      };
      listener = [
        {
	  timeout = 300; 
	  on-timeout = "hyprlock";
	}
        {
	  timeout = 360; 
	  on-timeout = "hyprctl dispatch dpms off"; 
	  on-resume = "hyprctl dispatch dpms on"; 
	}
        {
	  timeout = 600; 
	  on-timeout = "systemctl suspend"; 
	}
      ];
    };
  };
}
