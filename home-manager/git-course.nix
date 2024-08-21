{ ... }:
{
  programs.git = {
    enable = true;
    userEmail = "elev@gmail.com";
    userName = "elev";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
