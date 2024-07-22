{ inputs, ... }:
{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        width = 300;
        height = 300;
        offset = "30x50";
        origin = "top-right";
	corner_radius = 10;
      };

      urgency_normal = {
        timeout = 10;
      };
    };
  };
}
