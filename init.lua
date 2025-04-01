-- Set <space> as the leader key
-- See `:help mapleader`
-- NOTE: Must happen before other plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if have Nerd font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Delete Neovim background colouring, and use terminal background colours
-- TODO: Split off into own thing
vim.cmd [[
  " colorscheme peachpuff
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight NormalFloat guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
  highlight NormalFloat ctermbg=none
  "Mini statusline normal mode uses Cursor highlights, and Cursor uses Normal bg as guifg,
  "so needs to be set to something solid if using clear Normal background
  highlight Cursor guifg=NvimDarkGray2
]]

-- [[ Setting options ]]
require 'options'

-- [[ Basic Keymaps ]]
require 'keymaps'

-- [[ Install `lazy.nvim` plugin manager ]]
require 'lazy-bootstrap'

-- [[ Configure and install plugins ]]
require 'lazy-plugins'

-- vim: ts=2 sts=2 sw=2 et
