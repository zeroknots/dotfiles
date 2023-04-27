vim.api.nvim_command([[
augroup AutoCompileLatex
autocmd BufEnter *.sol :TSEnable highlight
augroup END 
]])
