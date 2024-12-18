-- Color scheme configuration
vim.opt.background = 'light'
vim.cmd('colorscheme catppuccin')
--- vim.cmd('colorscheme one')

-- Toggle background mapping
vim.keymap.set('n', '<Leader>bg', function()
  local new_bg = vim.o.background == 'dark' and 'light' or 'dark'
  vim.opt.background = new_bg
end)
