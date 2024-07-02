return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },

  -- local harpoon = require("harpoon")

  -- harpoon:setup()
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()

    vim.keymap.set('n', '<C-h>', function()
      harpoon:list():add()
    end,
    { desc = 'Add to harpoon' }
    )
    vim.keymap.set('n', '<leader>i', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end,
    { desc = 'Harpoon menu' }
    )

    vim.keymap.set('n', '<C-j>', function()
      harpoon:list():select(1)
    end,
    { desc = 'Switch to harpoon window 1' }
    )
    vim.keymap.set('n', '<C-k>', function()
      harpoon:list():select(2)
    end,
    { desc = 'Switch to harpoon window 2' }
    )
    vim.keymap.set('n', '<C-l>', function()
      harpoon:list():select(3)
    end,
    { desc = 'Switch to harpoon window 3' }
    )
    vim.keymap.set('n', '<C-m>', function()
      harpoon:list():select(4)
    end,
    { desc = 'Switch to harpoon window 4' }
    )
  end,
}
