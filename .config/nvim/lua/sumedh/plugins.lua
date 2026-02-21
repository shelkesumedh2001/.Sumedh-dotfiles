-- SUMEDH"S NEOVIM CONFIGURATION
-------------------------------------------------


require("lazy").setup({
--    {
--        "nvim-neorg/neorg",
--        lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
--        version = "*", -- Pin Neorg to the latest stable release
--        config = true,
--    },

-- Copilot
    {
      'zbirenbaum/copilot.lua',
      cmd = 'Copilot',
      event = 'InsertEnter',
      config = function()
        require('copilot').setup({
          suggestion = {
            enabled = true,
            auto_trigger = true,
            debounce = 75,
            keymap = {
              accept = false,  -- We handle Tab manually in maps.lua
              accept_word = false,
              accept_line = false,
              next = "<M-]>",
              prev = "<M-[>",
              dismiss = "<C-]>",
            },
          },
          filetypes = {
            '*',
          },
          panel = { enabled = true },
        })
      end,
    },

-- Dashboard is a nice start screen for nvim
    {
        "glepnir/dashboard-nvim",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function()
            local dashboard = require("dashboard")
            
            dashboard.setup {
                theme = 'doom',
                config = {
                    header = {
                        '',
                        '',
                        '                                                       ',
                        '                                                       ',
                        '   ███████╗██╗   ██╗███╗   ███╗███████╗██████╗ ██╗  ██╗',
                        '   ██╔════╝██║   ██║████╗ ████║██╔════╝██╔══██╗██║  ██║',
                        '   ███████╗██║   ██║██╔████╔██║█████╗  ██║  ██║███████║',
                        '   ╚════██║██║   ██║██║╚██╔╝██║██╔══╝  ██║  ██║██╔══██║',
                        '   ███████║╚██████╔╝██║ ╚═╝ ██║███████╗██████╔╝██║  ██║',
                        '   ╚══════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝╚═════╝ ╚═╝  ╚═╝',
                        '                                                       ',
                        '        ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓       ',
                        '        ▓                                       ▓       ',
                        '        ▓   🚀 Code with Confidence            ▓       ',
                        '        ▓   ⚡ Build with Speed                ▓       ',
                        '        ▓   🎯 Create with Precision           ▓       ',
                        '        ▓                                       ▓       ',
                        '        ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓       ',
                        '                                                       ',
                        '                                                       ',
                    },
                    center = {
                        {
                            icon = '   ',
                            icon_hl = 'Title',
                            desc = 'Find File                          ',
                            desc_hl = 'String',
                            key = 'f',
                            keymap = '',
                            key_hl = 'Number',
                            action = 'Telescope find_files'
                        },
                        {
                            icon = '   ',
                            icon_hl = 'Title',
                            desc = 'Recent Files                       ',
                            desc_hl = 'String',
                            key = 'r',
                            keymap = '',
                            key_hl = 'Number',
                            action = 'Telescope oldfiles'
                        },
                        {
                            icon = '   ',
                            icon_hl = 'Title',
                            desc = 'Search Text                        ',
                            desc_hl = 'String',
                            key = 'w',
                            keymap = '',
                            key_hl = 'Number',
                            action = 'Telescope live_grep'
                        },
                        {
                            icon = '   ',
                            icon_hl = 'Title',
                            desc = 'File Explorer                      ',
                            desc_hl = 'String',
                            key = 'e',
                            keymap = '',
                            key_hl = 'Number',
                            action = 'NvimTreeToggle'
                        },
                        {
                            icon = '   ',
                            icon_hl = 'Title',
                            desc = 'New C++ Project                    ',
                            desc_hl = 'String',
                            key = 'c',
                            keymap = '',
                            key_hl = 'Number',
                            action = 'enew | set filetype=cpp'
                        },
                        {
                            icon = '   ',
                            icon_hl = 'Title',
                            desc = 'Change Theme                       ',
                            desc_hl = 'String',
                            key = 't',
                            keymap = '',
                            key_hl = 'Number',
                            action = 'Telescope colorscheme'
                        },
                        {
                            icon = '   ',
                            icon_hl = 'Title',
                            desc = 'Exit Neovim                        ',
                            desc_hl = 'String',
                            key = 'q',
                            keymap = '',
                            key_hl = 'Number',
                            action = 'quit'
                        },
                    },
                    footer = function()
                        local stats = require("lazy").stats()
                        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                        local version = vim.version()
                        local nvim_version = "v" .. version.major .. "." .. version.minor .. "." .. version.patch
                        
                        return { 
                            '',
                            '',
                            '  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━',
                            '  ⚡ ' .. stats.loaded .. '/' .. stats.count .. ' plugins  │  ' .. ms .. 'ms startup  │  Neovim ' .. nvim_version,
                            '  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━',
                        }
                    end,
                }
            }
            
            -- Clean up dashboard appearance
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "dashboard",
                callback = function()
                    vim.opt_local.list = false
                    vim.opt_local.cursorline = false
                    vim.opt_local.number = false
                    vim.opt_local.relativenumber = false
                    vim.opt_local.signcolumn = "no"
                end,
            })
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

    -- Treesitter Configuration
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "cpp", "c", "lua", "vim", "python", "javascript", "typescript", "bash", "dart" },
                auto_install = true,
                highlight = {
                    enable = true,
                },
                indent = {
                    enable = true,
                },
            })
        end,
    },

    -- Productivity
    "vimwiki/vimwiki",
    "jreybert/vimagit",
    "nvim-orgmode/orgmode",
    "folke/which-key.nvim", -- Which Key
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
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },

    -- Other stuff --
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

    -- LSP Configuration
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },

    {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = { "clangd", "lua_ls", "pyright", "dartls" },
            automatic_installation = true,
        })
        
        -- Keybindings when LSP attaches
        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(args)
                local opts = { buffer = args.buf }
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
            end,
        })
        
        -- Use NEW vim.lsp.config API instead of lspconfig
        vim.lsp.config('*', {
            root_markers = { '.git' },
        })
        
        -- Enable LSP servers
        vim.lsp.enable('clangd')
        vim.lsp.enable('lua_ls')
        vim.lsp.enable('pyright')
        vim.lsp.enable('dartls')
    end
},
              -- Transparency
    "xiyaowong/transparent.nvim",

    -- Indent guides
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            indent = { char = "┊" },
            exclude = {
                filetypes = { "dashboard", "help", "terminal" }
            }
        }
    },

    -- Auto pairs
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },

    -- Flutter Development
    {
        'nvim-flutter/flutter-tools.nvim',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim',
        },
        config = function()
            require("flutter-tools").setup {
                lsp = {
                    color = {
                        enabled = true,
                    },
                },
                widget_guides = {
                    enabled = true,
                },
            }
        end
    },
})
