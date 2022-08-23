local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end
ts.compilers = {"gcc"}

ts.setup {
highligt = {
	enable = false 
	},
	ensure_installed = {
       "html",
       "lua",
       "tsx",
       "css",
       "javascript",
       "python",
       "cpp",
       "c_sharp"
    },
      autotag = {
	enable = true
	},
	rainbow = {
	enable = true,
	extended_mode = false,
	max_file_lines = nil,
	},
    autopairs = {
	enable = true,
	}
}


