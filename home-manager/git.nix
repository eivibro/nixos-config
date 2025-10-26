{ ... }:
{
  programs.git = {
    enable = true;
    settings.user = {
      email = "eivbro@gmail.com";
      name = "eivibro";
    };
    settings = {
      init.defaultBranch = "main";
    };
  };
}
