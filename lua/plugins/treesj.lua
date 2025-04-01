return {
  'Wansmer/treesj',
  keys = { '<C-m>', '<C-j>', '<C-s>' },
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    --   require('treesj').setup({--[[ your config ]]})
    vim.keymap.set('n', '<c-m>', require('treesj').toggle)
  end,
}
