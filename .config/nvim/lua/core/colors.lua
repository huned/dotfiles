-- Color scheme configuration

-- vim one (light/dark)
-- vim.cmd('colorscheme one')

-- catpuccin (light/dark)
-- vim.cmd('colorscheme catppuccin')
-- vim.opt.background = 'light' -- or 'dark'... used by catpuccin

-- see https://github.com/scottmckendry/cyberdream.nvim
require('cyberdream').setup({
  variant = 'default', -- default (light), auto (dark)
  transparent = true,
  borderless_pickers = true,
  extensions = {
    fzflua = true,
    markdown = true,
  }
})

vim.cmd('colorscheme cyberdream')

-- Toggle background mapping with <backslash>bg
vim.keymap.set('n', '<Leader>bg', function()
  -- catpuccin uses vim.opt.background, so probably other color schemes do also
  local new_bg = vim.o.background == 'dark' and 'light' or 'dark'
  vim.opt.background = new_bg
  vim.cmd('CyberdreamToggleMode')
end)
