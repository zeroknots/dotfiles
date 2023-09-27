return {
	"HiPhish/nvim-ts-rainbow2",
	config = function(_, opts)
		local rainbow = require("nvim-treesitter.configs")
		rainbow.setup(opts)
	end,
	opts = {
		rainbow = {
			enable = true,
			-- list of languages you want to disable the plugin for
			disable = { "jsx", "cpp" },
			-- Which query to use for finding delimiters
			query = "rainbow-parens",
			-- Highlight the entire buffer all at once
			strategy = require("ts-rainbow").strategy.global,
		},
	},
}
