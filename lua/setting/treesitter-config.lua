require('nvim-treesitter.configs').setup {
	ensure_installed = {
       "html",
       "lua",
       "css",
       "javascript",
       "python",
    },	
	highligt = {
		enable = true,
        additional_vim_regex_highlighting = false,
	},
	autotag = {
		enable = true,
	},	
	rainbow = {
		enable = true,
		extended_mode = false,
		max_file_lines = nil,
        colors = {
            "3AFFDB",
            "AE403F",
            "8FAA54",
            "F16529"
        }
	},
    autopairs = {
		enable = true, 
	},
    auto_install = true,
	ignore_install = { "ruby"}
}


