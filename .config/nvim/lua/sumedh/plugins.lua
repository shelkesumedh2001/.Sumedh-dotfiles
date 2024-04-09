
-- SUMEDH'S NEOVIM CONFIGURATION
-------------------------------------------------

local status, packer = pcall(require, "packer")
if not status then
    print("Packer is not installed")
    return
end

-- Reloads Neovim after whenever you save plugins.lua
vim.cmd([[
    augroup packer_user_config
      autocmd!
      autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup END
]])

packer.startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- Copilot
    use { "github/copilot.vim" }
 
    -- Dashboard is a nice start screen for nvim
    use {
        'glepnir/dashboard-nvim',
        requires = {'nvim-tree/nvim-web-devicons'},
        config = function()
            require('dashboard').setup {
                -- config
            }
        end,
    }

    -- Telescope
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' }
    })

    use("nvim-telescope/telescope-file-browser.nvim")

    use {
        'nvim-telescope/telescope-fzy-native.nvim'
    }

    use("nvim-treesitter/nvim-treesitter") -- Treesitter Syntax Highlighting

    -- Productivity
    use("vimwiki/vimwiki")
    use("jreybert/vimagit")
    use("nvim-orgmode/orgmode")

    use("folke/which-key.nvim") -- Which Key
    use("nvim-lualine/lualine.nvim") -- A better statusline

    -- File management --
    use("vifm/vifm.vim")
    use("scrooloose/nerdtree")
    use("tiagofumo/vim-nerdtree-syntax-highlight")
    use("ryanoasis/vim-devicons")

    -- Tim Pope Plugins --
    use("tpope/vim-surround")

    -- Syntax Highlighting and Colors --
    use("PotatoesMaster/i3-vim-syntax")
    use("kovetskiy/sxhkd-vim")
    use("vim-python/python-syntax")
    use("ap/vim-css-color")
    use("nickeb96/fish.vim")

    -- Junegunn Choi Plugins --
    use("junegunn/goyo.vim")
    use("junegunn/limelight.vim")
    use("junegunn/vim-emoji")

    -- Colorschemes --
    use("RRethy/nvim-base16")
    use("kyazdani42/nvim-palenight.lua")
    use("folke/tokyonight.nvim")
    use("rose-pine/neovim")
    use{"catppuccin/nvim", as = "catppuccin" }

    -- Other stuff --
    use("frazrepo/vim-rainbow")
    use("ThePrimeagen/vim-be-good")

    -- C++ Debugger
    use 'mfussenegger/nvim-dap'
    
    -- C++ syntax plugin
    use 'octol/vim-cpp-enhanced-highlight'

    -- Autocomplete
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
        },
        config = function()
            local cmp = require('cmp')
            cmp.setup({
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'buffer' },
                    { name = 'path' },
                },
            })
        end
    }
    
    use {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    }
    -- File Explorer
    use {
        'kyazdani42/nvim-tree.lua',
        config = function()
            require('nvim-tree').setup{
                auto_close=true,
            }
            vim.cmd('autocmd FileType nvimtree setlocal winfixheight')
        end
    }

    -- C++ Treesitter
    require('nvim-treesitter.configs').setup {
        ensure_installed = 'cpp', -- Install the C++ parser
        highlight = {
            enable = true, -- Enable treesitter-based syntax highlighting
        },
    }

    if packer_bootstrap then
        packer.sync()
    end
end)
