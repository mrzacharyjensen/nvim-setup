-- Logging variable to console based on file type
-- Set to register 'l'
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = { '*.js', '*.jsx', '*.ts', '*.tsx' },
  callback = function()
    vim.fn.setreg('l', 'viw"yyoconsole.log(""ypa: ", "ypa);')
  end,
})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*.rs',
  callback = function()
    vim.fn.setreg('l', 'viw"yyoprintln!(""ypa: {"ypa:?}");')
  end,
})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*.py',
  callback = function()
    vim.fn.setreg('l', 'viw"yyoprint(f""ypa: {"ypa}")')
  end,
})
