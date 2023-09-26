local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer()

-- Autocommand that reloads nvim whenever you save this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	use({ "catppuccin/nvim", as = "catppuccin" })
	use({ "Th3Whit3Wolf/one-nvim" })
	use("folke/tokyonight.nvim")
	use("sainnhe/sonokai")
	use({ "rose-pine/neovim", as = "rose-pine" })
	use("marko-cerovac/material.nvim")
	use("navarasu/onedark.nvim")
	use("EdenEast/nightfox.nvim")
	use({ "Everblush/nvim", as = "everblush" })
	use("navarasu/onedark.nvim")
	use("Mofiqul/dracula.nvim")

	use("rmehri01/onenord.nvim")
	use("olimorris/onedarkpro.nvim")
	use("cpea2506/one_monokai.nvim")
	use({
		"loctvl842/monokai-pro.nvim",
		config = function()
			require("monokai-pro").setup()
		end,
	})
	use("xiyaowong/transparent.nvim")

	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")
	use("bluz71/vim-nightfly-guicolors")
	use("nanotech/jellybeans.vim")
	use("christoomey/vim-tmux-navigator")
	use("szw/vim-maximizer")
	use("tpope/vim-surround")
	use("vim-scripts/ReplaceWithRegister")
	use("numToStr/Comment.nvim")
	use("nvim-lualine/lualine.nvim")

	-- icons
	use("kyazdani42/nvim-web-devicons")

	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",

		requires = { { "nvim-lua/plenary.nvim" }, { "kdheepak/lazygit.nvim" } },
		config = function()
			require("telescope").load_extension("lazygit")
		end,
	})

	-- use({
	-- 	"romgrk/kirby.nvim",
	-- 	requires = {
	-- 		{ "romgrk/fzy-lua-native", run = "make install" },
	-- 		{ "romgrk/kui.nvim" },
	-- 		{ "nvim-tree/nvim-web-devicons" },
	-- 	},
	-- }
	--
	--
	use({ "folke/trouble.nvim" })
	use("f-person/git-blame.nvim")

	use("nvim-pack/nvim-spectre")

	use({
		"dnlhc/glance.nvim",
	})
	use({ "kevinhwang91/nvim-bqf" })

	use("preservim/tagbar")

	use("almo7aya/openingh.nvim")

	use("ThePrimeagen/git-worktree.nvim")
	use("tpope/vim-fugitive")
	use("sindrets/diffview.nvim")

	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")

	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	use("xiyaowong/transparent.nvim")

	-- managing & installing lsp servers
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	-- Pretty Diagnostics LSP lines
	use({ "https://git.sr.ht/~whynothugo/lsp_lines.nvim" })

	-- LSP Zero
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{
				-- Optional
				"williamboman/mason.nvim",
				run = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
		},
	})

	use({
		"ellisonleao/glow.nvim",
		config = function()
			require("glow").setup()
		end,
	})
	use("sindrets/diffview.nvim")

	use("axkirillov/hbac.nvim")

	use({
		"ray-x/lsp_signature.nvim",
	})

	-- configuring lsp servers
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use({ "glepnir/lspsaga.nvim", branch = "main" })
	use("onsails/lspkind.nvim")

	-- lua with packer.nvim
	use({
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup()
		end,
	})

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	-- File Exploirer with lf
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup()
		end,
	})
	use("nvim-lua/plenary.nvim")

	use({
		"lmburns/lf.nvim",
		config = function()
			-- This feature will not work if the plugin is lazy-loaded
			vim.g.lf_netrw = 1

			vim.keymap.set("n", "<C-o>", ":Lf<CR>")
		end,
		requires = { "plenary.nvim", "toggleterm.nvim" },
	})

	use({
		"utilyre/barbecue.nvim",
		tag = "*",
		requires = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		after = "nvim-web-devicons", -- keep this if you're using NvChad
		config = function()
			require("barbecue").setup()
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	use({
		"andythigpen/nvim-coverage",
		requires = "nvim-lua/plenary.nvim",
		-- Optional: needed for PHP when using the cobertura parser
		rocks = { "lua-xmlreader" },
		config = function()
			require("coverage").setup()
		end,
	})

	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("nvim-treesitter/playground")
	use("nvim-treesitter/nvim-treesitter-context")

	use("HiPhish/nvim-ts-rainbow2")

	use("mbbill/undotree")

	use({ "nvim-telescope/telescope.nvim" })
	use({ "LinArcX/telescope-command-palette.nvim" })

	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	use("lewis6991/gitsigns.nvim")
	use({
		"pwntester/octo.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("octo").setup()
		end,
	})
	use({
		"akinsho/git-conflict.nvim",
		tag = "*",
		config = function()
			require("git-conflict").setup()
		end,
	})

	use("RRethy/vim-illuminate")

	vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	})
	use("ThePrimeagen/harpoon")

	-- use({
	-- 	"phaazon/hop.nvim",
	-- 	branch = "v2", -- optional but strongly recommended
	-- 	config = function()
	-- 		-- you can configure Hop the way you like here; see :h hop-config
	-- 		require("hop").setup({ keys = "etovwxeqdygfbhcksura" })
	-- 	end,
	-- })
	--
	use({
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	})

	-- which key
	use({
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
