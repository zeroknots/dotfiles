return {
	"nvim-neotest/neotest",
	dependencies = {
		"llllvvuu/neotest-foundry",
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = {
		adapters = {
			--require("neotest-plenatry"),
		},
	},
}
