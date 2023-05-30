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

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn", "info", "hint" },
	symbols = {
		error = icons.diagnostics.Error,
		hint = icons.diagnostics.Hint,
		info = icons.diagnostics.Info,
		warn = icons.diagnostics.Warn,
	},
	colored = true,
	update_in_insert = false,
	always_visible = false,
}

local diff = {
	"diff",
	symbols = {
		added = icons.git.added .. " ",
		untracked = icons.git.added .. " ",
		modified = icons.git.changed .. " ",
		removed = icons.git.deleted .. " ",
	},
	colored = true,
	always_visible = false,
}

-- local navic = {
--   function()
--     return require("nvim-navic").get_location()
--   end,
--   cond = function()
--     return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
--   end,
-- }

require("lualine").setup({
	options = {
		theme = "sonokai",
		transparent = true,
		globalstatus = true,
		component_separators = { left = "", right = "" },
		disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
	},
	sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { diff, diagnostics },
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
})
