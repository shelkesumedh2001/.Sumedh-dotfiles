
-- SUMEDH"S NEOVIM CONFIGURATION
-------------------------------------------------


require("lazy").setup({

    -- Copilot
    "github/copilot.vim",

    -- Dashboard is a nice start screen for nvim
    {
        "glepnir/dashboard-nvim",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function()
            require("dashboard").setup {
                -- config
            }
        end,
    },

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        dependencies = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" }
    },
    "nvim-telescope/telescope-file-browser.nvim",
    {
        "nvim-telescope/telescope-fzy-native.nvim"
    },

    "nvim-treesitter/nvim-treesitter", -- Treesitter Syntax Highlighting

    -- Productivity
    "vimwiki/vimwiki",
    "jreybert/vimagit",
    "nvim-orgmode/orgmode",
    "folke/which-key.nvim", -- Which Key
--    "nvim-lualine/lualine.nvim", -- A better statusline
{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
},
    -- File management --
    "vifm/vifm.vim",
    "scrooloose/nerdtree",
    "tiagofumo/vim-nerdtree-syntax-highlight",
    "ryanoasis/vim-devicons",
    -- Tim Pope Plugins --
    "tpope/vim-surround",
    -- Syntax Highlighting and Colors --
    "PotatoesMaster/i3-vim-syntax",
    "kovetskiy/sxhkd-vim",
    "vim-python/python-syntax",
    "ap/vim-css-color",
    "nickeb96/fish.vim",
    -- Junegunn Choi Plugins --
    "junegunn/goyo.vim",
    "junegunn/limelight.vim",
    "junegunn/vim-emoji",
    -- Colorschemes --
    "RRethy/nvim-base16",
    "kyazdani42/nvim-palenight.lua",
    "folke/tokyonight.nvim",
    "rose-pine/neovim",
    -- Other stuff --
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },

    "frazrepo/vim-rainbow",
    "ThePrimeagen/vim-be-good",
    -- C++ Debugger
    "mfussenegger/nvim-dap",
    -- C++ syntax plugin
    "octol/vim-cpp-enhanced-highlight",
    -- Autocomplete
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                sources = {
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "path" },
                },
            })
        end
    },

    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },

    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup()
            require("mason-lspconfig").setup_handlers ({
                function (server_name)
                    require("lspconfig")[server_name].setup ({})
                end,
            })
        end
    },

    "neovim/nvim-lspconfig",

    -- File Explorer
    {
        "kyazdani42/nvim-tree.lua",
        config = function()
            require("nvim-tree").setup{
            }
            vim.cmd("autocmd FileType nvimtree setlocal winfixheight")
        end
    },

    "xiyaowong/transparent.nvim",

    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    }

    -- C++ Treesitter
    -- require("nvim-treesitter.configs").setup {
    --     ensure_installed = "cpp", -- Install the C++ parser
    --     highlight = {
    --         enable = true, -- Enable treesitter-based syntax highlighting
    --     },
    -- }
})
