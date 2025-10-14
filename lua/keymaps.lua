-- Leader W to write out file
vim.keymap.set('n', '<leader>w', '<Cmd>w<CR>', { desc = '[W]rite to file' })

vim.keymap.set('n', '<leader>z', function()
  vim.notify('hi', vim.log.levels.ERROR)
end, { desc = '[z] Test function' })

-- Leader X to run command on current line
vim.keymap.set({ 'n', 'v' }, '<leader>x', function()
  local mode = vim.fn.mode()
  local command
  if mode == 'n' then
    -- If single line
    command = vim.fn.getline('.')
  else
    -- If multiple lines in visual mode
    local start_pos = vim.fn.getpos("'<")[2]
    local end_pos = vim.fn.getpos("'>")[2]
    command = table.concat(vim.fn.getline(start_pos, end_pos), "\n")
  end

  local stdout, stderr = {}, {}

  vim.fn.jobstart(command, {
    stdout_buffered = true,
    stderr_buffered = true,
    on_stdout = function(_, data)
      if data and #data > 0 and data[1] ~= '' then
        vim.list_extend(stdout, data)
      end
    end,
    on_stderr = function(_, data)
      if data and #data > 0 and data[1] ~= '' then
        vim.list_extend(stderr, data)
      end
    end,
    on_exit = function(_, code)
      if #stdout > 0 then
        vim.api.nvim_echo({ { table.concat(stdout, '\n'), "Normal" } }, true, {})
      elseif #stderr > 0 then
        vim.api.nvim_echo({ { table.concat(stderr, '\n'), "Normal" } }, true, {})
      elseif code ~= 0 then
        vim.notify("Command exited with code " .. code, vim.log.levels.ERROR)
      else
        vim.notify("Command succeeded (no output)", vim.log.levels.INFO)
      end
    end
  })
end, { desc = 'E[x]ecute line asynchronously' })

-- Emacs style key movements in insert mode

-- backward-char
vim.keymap.set('i', '<C-b>', '<Left>', { silent = true })
-- forward-char
vim.keymap.set('i', '<C-f>', '<Right>', { silent = true })
-- previous-line
vim.keymap.set('i', '<C-p>', '<Up>', { silent = true })
-- next-line
vim.keymap.set('i', '<C-n>', '<Down>', { silent = true })
-- move-beginning-of-line
vim.keymap.set('i', '<C-a>', '<Home>', { silent = true })
-- move-end-of-line
vim.keymap.set('i', '<C-e>', '<End>', { silent = true })

-- backward-sentence
vim.keymap.set('i', '<M-a>', '<C-o>(', { silent = true })
-- forward-sentence
vim.keymap.set('i', '<M-e>', '<C-o>)', { silent = true })

-- backward-word
vim.keymap.set('i', '<M-b>', '<C-Left>', { silent = true })
-- forward-word
vim.keymap.set('i', '<M-f>', '<C-Right>', { silent = true })

-- scroll-down-command
vim.keymap.set('i', '<M-v>', '<PageUp>', { silent = true })
-- scroll-up-command
vim.keymap.set('i', '<C-v>', '<PageDown>', { silent = true })

-- delete-char
vim.keymap.set('i', '<C-d>', '<Del>', { silent = true })

-- delete-region
vim.keymap.set('i', '<M-BS>', '<C-w>', { silent = true })

-- delete-word-forward
vim.keymap.set('i', '<M-d>', function()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  local line = vim.api.nvim_get_current_line()

  if #line <= col then
    return '<Del><C-o>dw'
  end

  return '<C-o>dw'
end, { silent = true, expr = true })

-- delete-line-forward
vim.keymap.set('i', '<C-k>', function()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  local line = vim.api.nvim_get_current_line()

  if #line <= col then
    return '<Del>'
  end

  return '<C-o>d$'
end, { silent = true, expr = true })

-- delete-sentence
vim.keymap.set('i', '<M-k>', '<C-o>d)', { silent = true })

-- centre screen on cursor
-- BUG: Centering with C-o does not work
-- vim.keymap.set('i', '<C-l>', '<C-o>zz', { silent = true })

vim.keymap.set('i', '<C-l>', '<cmd>normal! zz<CR>', { silent = true })
-- vim.keymap.set('i', '<C-p>', '<Right>', { silent = true })
-- vim.keymap.set('i', '<C-l>', '<cmd>echo "It works I guess"<CR>')


-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
