-- you dont need to set any of these options. these are the default ones. only
-- the loading is important
require('telescope').setup {
	
	defaults = {
		-- default configuration for telescope goes here:
		-- config_key = value,
		mappings = {
			i = {
			-- map actions.which_key to <c-h> (default: <c-/>)
			-- actions.which_key shows the mappings for your picker,
			-- e.g. git_{create, delete, ...}_branch for the git_branches picker
			["<c-h>"] = "which_key"
			}
		}
	},

	pickers = {
		-- default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
    	-- }
    	-- Now the picker_config_key will be applied every time you call this
    	-- builtin picker
	},

	extensions = {
		fzf = {
		fuzzy = true,                    -- false will only do exact matching
		override_generic_sorter = true,  -- override the generic sorter
		override_file_sorter = true,     -- override the file sorter
		case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
		                                 -- the default case_mode is "smart_case"
		}
	}
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

require'lspconfig'.pyright.setup{}
