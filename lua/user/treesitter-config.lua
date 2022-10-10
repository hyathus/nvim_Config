local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end
ts.compilers = { "clang" }

ts.setup({
	ensure_installed = {
		"html",
		"lua",
		"json",
		"tsx",
		"css",
		"python",
		"cpp",
		"c_sharp",
		"javascript",
		"typescript",
		"scss",
		"bash",
	},
	highlight = { enable = true },
	autotag = { enable = true },
	rainbow = {
		enable = true,
		extended_mode = false,
		max_file_lines = nil,
	},
	autopairs = {
		enable = true,
	},
	textobjects = {
		select = {
			enable = true,
			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
		swap = {
			enable = true,
			swap_next = { ["<leader>as"] = "@parameter.inner" },
			swap_previous = { ["<leader>As"] = "@parameter.inner" },
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
		peek_definition_code = {
			["<leader>df"] = "@function.outer",
			["<leader>dF"] = "@class.outer",
		},
	},
})
