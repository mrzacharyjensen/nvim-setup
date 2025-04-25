return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  opts = {},

  config = function()
    local fzf = require("fzf-lua")
    fzf.setup({

    })

    -- Files
    vim.keymap.set('n', '<leader>sf', function() require("fzf-lua").files() end, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>sF', function() require("fzf-lua").git_files() end, { desc = '[S]earch [F]iles (Git)' })

    -- Buffers & Recent
    vim.keymap.set('n', '<leader><leader>', function() require("fzf-lua").buffers() end,
      { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>s.', function() require("fzf-lua").oldfiles() end,
      { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader>sr', function() require("fzf-lua").resume() end, { desc = '[S]earch [R]esume' })

    -- Grep
    vim.keymap.set('n', '<leader>sg', function() require("fzf-lua").live_grep_native() end,
      { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sw', function() require("fzf-lua").grep_cword() end,
      { desc = '[S]earch [W]ord' })
    vim.keymap.set('v', '<leader>sw', function() require("fzf-lua").grep_visual() end,
      { desc = '[S]earch [W]ord (Visual)' })

    -- Help & Commands
    vim.keymap.set('n', '<leader>sh', function() require("fzf-lua").help_tags() end, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sk', function() require("fzf-lua").keymaps() end, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>sc', function() require("fzf-lua").commands() end, { desc = '[S]earch [C]ommands' })

    -- Misc
    vim.keymap.set('n', '<leader>ss', function() require("fzf-lua").builtin() end, { desc = '[S]earch [S]elect FZF' })
    vim.keymap.set('n', '<leader>sd', function() require("fzf-lua").diagnostics_document() end,
      { desc = '[S]earch [D]iagnostics (Buffer)' })
    vim.keymap.set('n', '<leader>sD', function() require("fzf-lua").diagnostics_workspace() end,
      { desc = '[S]earch [D]iagnostics (Workspace)' })
    vim.keymap.set('n', '<leader>st', '<Cmd>TodoFzfLua<CR>', { desc = '[S]earch [S]elect FZF' })
  end


  -- local builtin = require 'telescope.builtin'
  -- vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
  -- vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
  -- vim.keymap.set('n', '<leader>st', '<Cmd>TodoTelescope<CR>', { desc = '[S]earch [T]odos' })
  --
  -- -- Slightly advanced example of overriding default behavior and theme
  -- vim.keymap.set('n', '<leader>/', function()
  --   -- You can pass additional configuration to Telescope to change the theme, layout, etc.
  --   builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
  --     winblend = 10,
  --     previewer = false,
  --   })
  -- end, { desc = '[/] Fuzzily search in current buffer' })
  --
  -- -- It's also possible to pass additional configuration options.
  -- --  See `:help telescope.builtin.live_grep()` for information about particular keys
  -- vim.keymap.set('n', '<leader>s/', function()
  --   builtin.live_grep {
  --     grep_open_files = true,
  --     prompt_title = 'Live Grep in Open Files',
  --   }
  -- end, { desc = '[S]earch [/] in Open Files' })
  --
  -- -- Shortcut for searching your Neovim configuration files
  -- vim.keymap.set('n', '<leader>sn', function()
  --   builtin.find_files { cwd = vim.fn.stdpath 'config' }
  -- end, { desc = '[S]earch [N]eovim files' })
}
