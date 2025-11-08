{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = { 
        email = "eivbro@gmail.com";
        name = "eivibro";
      };
      init.defaultBranch = "main";
    };
  };
}
