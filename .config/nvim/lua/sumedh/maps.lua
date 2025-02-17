-------------------------------------------------
-- SUMEDH'S NEOVIM CONFIGURATION
-------------------------------------------------

-------------------------------------------------
-- KEYBINDINGS
-------------------------------------------------
local function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true })
end


-- Mimic shell movements
map("i", "<C-E>", "<ESC>A")
map("i", "<C-A>", "<ESC>I")

-- Load recent sessions
map("n", "<leader>sl", "<CMD>SessionLoad<CR>")

-- Keybindings for telescope
map("n", "<leader>fr", "<CMD>Telescope oldfiles<CR>")
map("n", "<leader>ff", "<CMD>Telescope find_files hidden=true<CR>")
map("n", "<leader>fb", "<CMD>Telescope file_browser<CR>")
map("n", "<leader>fw", "<CMD>Telescope live_grep<CR>")
map("n", "<leader>ht", "<CMD>Telescope colorscheme<CR>")

-- Keybindings for NvimTree
--map("n", "<leader>ft", "<CMD>NvimTreeToggle<CR>")

-- Keybindings for switching between NvimTree and code editing space
map("n", "<leader>nt", "<CMD>NvimTreeToggle<CR>") -- Switch to NvimTree
map("n", "<leader>nn", "<CMD>bnext<CR>") -- Switch to next buffer
map("n", "<leader>np", "<CMD>bprevious<CR>") -- Switch to previous buffer

-- Keybindings for building and running C++ code
vim.api.nvim_set_keymap('n', '<F10>', ':!g++ -o %< % <CR> :term ./%< <CR> i', { noremap = true })

-- Keybinding to open a terminal buffer
map("n", "<F12>", ":term<CR>")

--Copilot
--vim.api.nvim_set_keymap('i', '<C-J>', '<Cmd>lua require"copilot".complete()<CR>', { noremap = false, silent = false })

--vim.g.copilot_assume_mapped = true

--vim.api.nvim_set_keymap("i", "<TAB>", 'copilot#Accept("<CR>")', { expr = true })

-- Copilot tab behavior
-- Copilot mappings
vim.api.nvim_set_keymap("i", "<C-l>", "<CMD>lua require('copilot.suggestion').accept()<CR>", { silent = true, noremap = false })

-- Custom tab behavior
vim.api.nvim_set_keymap("i", "<Tab>", 'pumvisible() ? "<C-n>" : v:lua.check_back_space() ? "<TAB>" : "<CMD>lua require(\'copilot.suggestion\').accept()<CR>"', { expr = true, noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<S-Tab>", 'pumvisible() ? "<C-p>" : "<C-h>"', { expr = true, noremap = true })

-- Check for backspace
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end
