return {
	"nvim-neotest/neotest",
	dependencies = {
		"llllvvuu/neotest-foundry",
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"antoinemadec/FixCursorHold.nvim",
	},
	config = function(_, opts)
		require("neotest").setup(opts)
	end,
	opts = {
		adapters = {
			require("neotest-plenary"),
			require("neotest-foundry"),
		},
	},

	keys = {
		{
			"<leader>mt",
			'<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<cr>',
			{ silent = true, desc = "Neotest run" },
		},
	},
}
