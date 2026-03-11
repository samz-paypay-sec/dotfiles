-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set('n', '<Leader>n', ':NvimTreeOpen<CR>')
vim.keymap.set('n', '<Leader>nf', ':NvimTreeFindFile<CR>')
vim.keymap.set('n', '<Leader>nc', ':NvimTreeClose<CR>')

require('nvim-tree').setup {
  filters = {
    dotfiles = true,
  },
  view = {
      width = 40,
  },
}
