-- FZF configuration
vim.g.fzf_preview_window = {'right:50%', 'ctrl-/'}
vim.g.fzf_layout = { window = { width = 0.8, height = 0.8 } }
vim.keymap.set('n', '<c-p>', ':Files<CR>')
