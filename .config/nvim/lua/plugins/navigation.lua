return {
	"christoomey/vim-tmux-navigator",
	{
		"phaazon/hop.nvim",
		version = "v2", -- optional but strongly recommended
		lazy = false,
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
		keys = {
			"<leader> ",
			":HopWord<CR>",
			{ silent = true, desc = "Hop word" },
		},
	},
}
