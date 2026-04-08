{ ... }:
{
  programs.neovim = {
    initLua = ''
      vim.opt.relativenumber = true
      vim.opt.cursorline = true
      if vim.g.vscode then
        -- VSCodium-specific: don't load UI plugins
        return
      end
    '';
  };
}
