require("nvim-tree").setup({
  sort_by = "case_sensitive",
 update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "<space>e", action = "NvimTreeOpen" },
      },
    },
  },
  renderer = {
    group_empty = true,
    highlight_opened_files = "name",
  },
  filters = {
    dotfiles = true,
  },
  actions = {
	  open_file = {
		  quit_on_open = true,
	  },
  },
})



 
