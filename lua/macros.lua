-- Logging variable to console based on file type
-- Set to register 'l' for selecting word under cursor
-- Set to register 'p' for already selected variable in visual mode
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = { '*.js', '*.jsx', '*.ts', '*.tsx' },
  callback = function()
    vim.fn.setreg('l', 'viw"yyoconsole.log(""ypa: ", "ypa);')
    vim.fn.setreg('p', '"yyoconsole.log(""ypa: ", "ypa);')
  end,
})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*.rs',
  callback = function()
    vim.fn.setreg('l', 'viw"yyoprintln!(""ypa: {"ypa:?}");')
    vim.fn.setreg('p', '"yyoprintln!(""ypa: {"ypa:?}");')
  end,
})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*.py',
  callback = function()
    vim.fn.setreg('l', 'viw"yyoprint(f""ypa: {"ypa}")')
    vim.fn.setreg('p', '"yyoprint(f""ypa: {"ypa}")')
  end,
})
