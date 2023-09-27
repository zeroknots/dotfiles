return {
	"christoomey/vim-tmux-navigator",
		{"phaazon/hop.nvim",
		version = "v2", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
  }
}
