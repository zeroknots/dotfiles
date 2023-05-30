local setup, gitsigns = pcall(require, "gitsigns")
if not setup then
	return
end

local icons = {
	diagnostics = {
		Error = " ",
		Warn = " ",
		Hint = " ",
		Info = " ",
	},
	git = {
		added = "",
		changed = "",
		deleted = "",
	},
}

gitsigns.setup({
	signs = {
		add = { text = icons.git.added },
		change = { text = icons.git.changed },
		delete = { text = icons.git.deleted },
		topdelete = { text = icons.git.deleted },
		changedelete = { text = icons.git.changed },
		untracked = { text = icons.git.added },
	},
})
