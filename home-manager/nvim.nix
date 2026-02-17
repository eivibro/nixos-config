{ ... }:
{
  programs.neovim = {
    initLua = ''
      vim.opt.relativenumber = true
      vim.opt.cursorline = true
    '';
  };
}
