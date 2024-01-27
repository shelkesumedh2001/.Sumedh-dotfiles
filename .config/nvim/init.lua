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

vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
vim.cmd('hi NonText guibg=NONE ctermbg=NONE')

end)
