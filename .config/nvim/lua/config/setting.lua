vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.g.loaded_node_provider = 0    -- 禁用node插件
vim.g.loaded_perl_provider = 0    -- 禁用perl插件
vim.g.loaded_python3_provider = 0  -- 禁用python插件
vim.g.loaded_ruby_provider = 0    -- 禁用ruby插件

vim.opt.breakindent = true        -- 换行后自动缩进
vim.opt.clipboard = "unnamedplus" -- 使用系统剪贴板
vim.opt.expandtab = true          -- 将Tab转换为空格
vim.opt.ignorecase = true         -- 搜索时忽略大小写
vim.opt.number = true             -- 显示行号
vim.opt.relativenumber = true     -- 显示相对行号
vim.opt.shiftwidth = 2            -- 缩进宽度
vim.opt.tabstop = 2               -- Tab宽度
vim.opt.termguicolors = true      -- 终端全彩模式

if not vim.g.vscode then
  vim.g.clipboard = {
    name = "WSLClipboard",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe"
    },
    paste = {
      ["+"] =
      'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ["*"] =
      'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))'
    },
    cache_enabled = 0
  }
end
