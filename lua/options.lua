-- Make line numbers default
vim.opt.number = true
-- Relative line numbers to help with jumping
vim.opt.relativenumber = true

-- Show active file in title of terminal
vim.o.title = true
-- Only show filename and not path in terminal window title
vim.o.titlestring = '%t'

-- Enable mouse mode, can be useful for resizing splits
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
-- TODO: Activate this once status line is installed
-- vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
-- TODO: Figure out what this does
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how Neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
-- vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Conceal syntax when not needed, such as quotes in JSON files
vim.opt.conceallevel = 2

-- Tab/Space properties
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Go files to use tabs instead, and change tab to 4 spaces
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*.go',
  command = 'set noexpandtab shiftwidth=4',
})

-- Set help pages to open in full window, not split pane
vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = '*',
  callback = function(event)
    if vim.bo[event.buf].filetype == 'help' then
      vim.cmd.only() -- same as piping only i.e. :help query | only
      vim.bo.buflisted = true
    end
  end,
})

-- Set autocommand for Markdown files to have rendered linebreaks and spelling
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*.md',
  command = 'setlocal linebreak spell spelllang=en_nz',
})

-- Virtual text diagnostic
-- To get back to inline, do virtual_text = true instead.
-- To do multiline, do virtual_lines = true instead.
vim.diagnostic.config({ virtual_text = true })
