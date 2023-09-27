return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	opts = function(plugin)
		if plugin.override then
			require("lazyvim.util").deprecate("lualine.override", "lualine.opts")
		end

		local icons = require("core.icons")

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

		return {
			options = {
				theme = "auto",
				globalstatus = true,
				component_separators = { left = "", right = "" },
				disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { { "filename", path = 3 } },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		}
	end,
}
