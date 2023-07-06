
-- cpp_template.lua

vim.api.nvim_exec([[
augroup CPPTemplate
  autocmd!
  autocmd BufNewFile *.cpp execute '0r ' .. expand('~/.config/nvim/lua/dt/cpp_template.cpp')
augroup END
]], false)
