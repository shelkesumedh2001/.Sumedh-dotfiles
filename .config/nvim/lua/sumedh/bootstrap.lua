-------------------------------------------------------------------------------------------------------------------------
--   _____                          ____   _          _   __                _              ______            _____      
--  / ___/__  ______ ___  ___  ____/ / /_ ( )_____   / | / /__  ____ _   __(_)___ ___     / ____/___  ____  / __(_)___ _
--  \__ \/ / / / __ `__ \/ _ \/ __  / __ \|// ___/  /  |/ / _ \/ __ \ | / / / __ `__ \   / /   / __ \/ __ \/ /_/ / __ `/
-- ___/ / /_/ / / / / / /  __/ /_/ / / / / (__  )  / /|  /  __/ /_/ / |/ / / / / / / /  / /___/ /_/ / / / / __/ / /_/ / 
--/____/\__,_/_/ /_/ /_/\___/\__,_/_/ /_/ /____/  /_/ |_/\___/\____/|___/_/_/ /_/ /_/   \____/\____/_/ /_/_/ /_/\__, /  
--                                                                                                             /____/   
-------------------------------------------------------------------------------------------------------------------------

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.cmd([[packadd packer.nvim]])
end
