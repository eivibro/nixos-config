{ ... }:
{
  programs.neovim = {
    extraLuaConfig = ''
      vim.opt.relativenumber = true
      vim.opt.cursorline = true
    '';
  };
}
