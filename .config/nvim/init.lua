------------------------------------------------------------------------------------------------------------------------
--   _____                          ____   _          _   __                _              ______            _____      
--  / ___/__  ______ ___  ___  ____/ / /_ ( )_____   / | / /__  ____ _   __(_)___ ___     / ____/___  ____  / __(_)___ _
--  \__ \/ / / / __ `__ \/ _ \/ __  / __ \|// ___/  /  |/ / _ \/ __ \ | / / / __ `__ \   / /   / __ \/ __ \/ /_/ / __ `/
-- ___/ / /_/ / / / / / /  __/ /_/ / / / / (__  )  / /|  /  __/ /_/ / |/ / / / / / / /  / /___/ /_/ / / / / __/ / /_/ / 
--/____/\__,_/_/ /_/ /_/\___/\__,_/_/ /_/ /____/  /_/ |_/\___/\____/|___/_/_/ /_/ /_/   \____/\____/_/ /_/_/ /_/\__, /  
--                                                                                                             /____/   
------------------------------------------------------------------------------------------------------------------------

require("sumedh.base") -- General Settings
require("sumedh.highlights") -- Colourscheme and other highlights
require("sumedh.maps") -- Keymaps
require("sumedh.plugins") -- Plugins
require("sumedh.bootstrap") -- Packer Auto-Installer
require("sumedh.cpp_template") --Template for C++ Files


-- Load Packer
return require('packer').startup(function()
  -- Packer configuration code goes here

  use({
		'rose-pine/neovim',
		--as = 'rose-pine',
		--config = function()
				--vim.cmd('colorscheme rose-pine')
		--end
	})

  
    --Tokyonight theme
  use({
        'folke/tokyonight.nvim',
        as = 'tokyonight',
        config = function()
                --vim.g.tokyonight_style = 'storm'
                --vim.cmd("colorscheme tokyonight-storm")
                  vim.cmd[[colorscheme tokyonight-storm]]
        end
    })

    --catppuccin theme
   use({
		'catppuccin/nvim',
		as = 'catppuccin',
		config = function()
				vim.cmd('colorscheme catppuccin')
		end
	})   
    --
--C++ Debugger
  use 'mfussenegger/nvim-dap'
--  use { 'tribela/vim-transparent' }
-- nvim-treesitter
  use {
  'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
      --telescope
  use {
  'nvim-telescope/telescope.nvim',
  requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' }
}
  use {
  'nvim-telescope/telescope-fzy-native.nvim',
  requires = { 'nvim-telescope/telescope.nvim' }
}
    -- coc.nvim
  use {
    'neoclide/coc.nvim',
    branch = 'release'
  }
  -- C++ syntax plugin
  use 'octol/vim-cpp-enhanced-highlight'

  --Autocomplete

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
  --File Explorer

  use {
  'kyazdani42/nvim-tree.lua',
  config = function()
    require('nvim-tree').setup{
      auto_close=true,}
    vim.cmd('autocmd FileType nvimtree setlocal winfixheight')
  end
}
  --C++ Treesitter

  require('nvim-treesitter.configs').setup {
  ensure_installed = 'cpp', -- Install the C++ parser
  highlight = {
    enable = true, -- Enable treesitter-based syntax highlighting
  },
}
    -- vimspector
  --[[use {
    'puremourning/vimspector',
    config = function()
      -- Use the default configuration for C++
      -- See the vimspector documentation for other languages
      require('vimspector').configurations['cpp'] = {
        adapter = 'vscode-cpptools',
        configuration = {
          name = 'Launch',
          type = 'cppdbg',
          request = 'launch',
          program = '${file}',
          args = {},
          cwd = vim.fn.getcwd(),
          stopOnEntry = false,
          -- Adjust this if you want to attach to a running process
          attach = nil,
          env = {},
          outDir = nil,
          port = nil,
        },
      }
    end,
  }--]]

    -- vim-fugitive
  --use 'tpope/vim-fugitive'

    -- vim-surround
  use 'tpope/vim-surround'

    -- Set up LSP
    local lsp = require('lspconfig')
    lsp.clangd.setup({})

    --Compiler like C++
    -- Build C++ code
  --vim.cmd("command! -nargs=* Build :!g++ -std=c++11 -Wall % -o %<.out && echo 'Build successful'")


    -- Run compiled C++ code
  --vim.cmd("command! -nargs=* Run :!./%<.out")

end)
