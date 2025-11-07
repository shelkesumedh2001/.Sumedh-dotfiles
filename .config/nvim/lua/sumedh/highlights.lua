-------------------------------------------------
-- SUMEDH'S NEOVIM CONFIGURATION
-------------------------------------------------
-------------------------------------------------
-- COLORSCHEMES
-------------------------------------------------

local vim = vim

-- Uncomment just ONE of the following colorschemes!
--local ok, _ = pcall(vim.cmd, 'colorscheme rose-pine')

--if not ok then
    -- Handle error if the color scheme fails to load
--    print('Error: Failed to load the "rose-pine" color scheme')
--end

-- Rest of your code...
-- Uncomment just ONE of the following colorschemes!
--local ok, _ = pcall(vim.cmd, 'colorscheme rose-pine')

--local ok, _ = pcall(vim.cmd, 'colorscheme catppuccin-frappe')
local ok, _ = pcall(vim.cmd, 'colorscheme base16-catppuccin-macchiato')
--local ok, _ = pcall(vim.cmd, 'colorscheme catppuccin-mocha')
--local ok, _ = pcall(vim.cmd, 'colorscheme rose-pine')
--local ok, _ = pcall(vim.cmd, 'colorscheme catppuccin-latte')
--local ok, _ = pcall(vim.cmd, 'colorscheme tokyonight-storm')
--local ok, _ = pcall(vim.cmd, 'colorscheme base16-dracula')
-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-gruvbox-dark-medium')
--local ok, _ = pcall(vim.cmd, 'colorscheme base16-monokai')
-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-nord')
-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-oceanicnext')
--local ok, _ = pcall(vim.cmd, "colorscheme base16-onedark") Def
--local ok, _ = pcall(vim.cmd, 'colorscheme palenight')
 --local ok, _ = pcall(vim.cmd, 'colorscheme base16-solarized-dark')
-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-solarized-light')
-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-tomorrow-night')


--vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
--vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})

-- Highlight the region on yank
vim.api.nvim_create_autocmd("TextYankPost", {
--	group = num_au,
	group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 120 })
	end,
})
