{ ... }:
{
  programs.git = {
    enable = true;
    signing.format = null;
    ignores = [ ".direnv" ".venv" "__pycache__" "*.pyc" ];

    settings = {
      user = { 
        email = "eivbro@gmail.com";
        name = "eivibro";
      };
      init.defaultBranch = "main";
      pull.rebase = false;  # use merge, not rebase, on git pull
      merge.ff = "false";   # always create a merge commit, never fast-forward
    };
  };
}
