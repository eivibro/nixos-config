{ ... }:
{
  programs.git = {
    enable = true;
    userEmail = "eivbro@gmail.com";
    userName = "eivibro";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
