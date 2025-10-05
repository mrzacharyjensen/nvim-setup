-- Use one of the default inbuilt themes
-- vim.cmd("colorscheme peachpuff")

vim.cmd("colorscheme rose-pine")

-- Delete Neovim background colouring, and use terminal background colours
vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight NormalFloat guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
  highlight NormalFloat ctermbg=none
  "Mini statusline normal mode uses Cursor highlights, and Cursor uses Normal bg as guifg,
  "so needs to be set to something solid if using clear Normal background
  "highlight Cursor guifg=NvimDarkGray2
]]
