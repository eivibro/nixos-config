{ ... }:
{
  programs.git = {
    enable = true;
    signing.format = null;
    settings = {
      user = { 
        email = "eivbro@gmail.com";
        name = "eivibro";
      };
      init.defaultBranch = "main";
    };
  };
}
