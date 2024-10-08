-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Show active file in title of terminal
vim.o.title = true

-- Only show filename and not path in terminal window title
vim.o.titlestring = '%t'

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
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

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Conceal syntax when not needed, such as quotes in JSON files.
vim.opt.conceallevel = 2

-- Set autocommand for files to change tab to 2 spaces
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  command = 'set expandtab shiftwidth=2',
})

-- Set autocommand for Python files to change tab to 4 spaces
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*.py',
  command = 'set expandtab shiftwidth=4',
})

-- Set autocommand for help pages to open in full window, not split pane
vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = '*',
  callback = function (event)
    if vim.bo[event.buf].filetype == 'help' then
      vim.cmd.only() -- same as piping only i.e. :help query | only
      vim.bo.buflisted = true
    end
  end,
})

-- vim: ts=2 sts=2 sw=2 et
