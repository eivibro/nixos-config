{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user.email = "eivbro@gmail.com";
      user.name = "eivibro";
      init.defaultBranch = "main";
    };
  };
}
