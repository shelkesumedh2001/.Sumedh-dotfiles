------------------------------------------------------------------------------------------------------------------------
--   _____                          ____   _          _   __                _              ______            _____      
--  / ___/__  ______ ___  ___  ____/ / /_ ( )_____   / | / /__  ____ _   __(_)___ ___     / ____/___  ____  / __(_)___ _
--  \__ \/ / / / __ `__ \/ _ \/ __  / __ \|// ___/  /  |/ / _ \/ __ \ | / / / __ `__ \   / /   / __ \/ __ \/ /_/ / __ `/
-- ___/ / /_/ / / / / / /  __/ /_/ / / / / (__  )  / /|  /  __/ /_/ / |/ / / / / / / /  / /___/ /_/ / / / / __/ / /_/ / 
--/____/\__,_/_/ /_/ /_/\___/\__,_/_/ /_/ /____/  /_/ |_/\___/\____/|___/_/_/ /_/ /_/   \____/\____/_/ /_/_/ /_/\__, /  
--                                                                                                             /____/   
------------------------------------------------------------------------------------------------------------------------

local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

ts.setup({
	-- If TS highlights are not enabled at all, or disabled via `disable` prop,
	-- highlighting will fallback to default Vim syntax highlighting
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = {"tsx","html", "css",  "markdown", "org" , "cpp", "vimdoc", "javascript", "typescript", "c", "lua", "rust" , "vim", "query"}, -- Required for spellcheck, some LaTex highlights and code block highlights that do not have ts grammar
	},
	--ensure_installed = { "org", "lua" }, -- Or run :TSUpdate org
  -- A list of parser names, or "all"
  ensure_installed = { "tsx","html", "css",  "markdown", "org", "cpp", "vimdoc", "javascript", "typescript", "c", "lua", "rust", "vim", "query"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,



    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    --additional_vim_regex_highlighting = false,
  

})
