require'nvim-treesitter.install'.compilers = {"gcc"}

require'nvim-treesitter.configs'.setup {
	ensure_installed = {
       "html",
       "lua",
       "tsx",
       "css",
       "javascript",
       "python"
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
	},
    autopairs = {
		enable = true, 
	},
    auto_install = true,
	ignore_install = { ""}
}


