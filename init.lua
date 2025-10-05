-- Set <space> as the leader key
-- See `:help mapleader`
-- NOTE: Must happen before other plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if have Nerd font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
require 'options'

-- [[ Basic Keymaps ]]
require 'keymaps'

-- [[ Install `lazy.nvim` plugin manager ]]
require 'lazy-bootstrap'

-- [[ Configure and install plugins ]]
require 'lazy-plugins'

-- [[ Configure macros that are set when buffer is loaded ]]
require 'macros'

-- [[ Colour themes ]]
require 'themes'

-- vim: ts=2 sts=2 sw=2 et
