-- set leader key
vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps

keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<leader>nh", ":nohl<CR>") -- no highlight

-- Move the highlighted text up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- Append line below to the current line, the cursor stays at the front
keymap.set("n", "J", "mzJ`z")

-- Half-page jumps, cursos stays in the center
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

keymap.set("n", "x", '"_x')

-- splits
keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>|", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>-", "<C-w>s")
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>sx", ":close<CR>")
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- terminal
keymap.set("n", "<leader>tt", ":ToggleTerm<CR>")

-- tabs
keymap.set("n", "<leader>to", ":tabnew<CR>")
keymap.set("n", "<leader>tx", ":tabclose<CR>")
keymap.set("n", "<leader>tn", ":tabn<CR>")
keymap.set("n", "<leader>tp", ":tabp<CR>")

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>gb", builtin.git_branches, {})
keymap.set("n", "<C-p>", ":Telescope git_files<CR>")
keymap.set("n", "<leader>fc", ":Telescope command_palette<CR>")

-- git
keymap.set("n", "<leader>gl", ":LazyGit<CR>")
keymap.set("n", "gu", "<cmd>diffget //2<CR>") -- get the upper version of the diff
keymap.set("n", "gh", "<cmd>diffget //3<CR>") -- get the lower version of the diff
keymap.set("n", "<leader>gwc", ":Telescope git_worktree create_git_worktree <CR>") -- get the lower version of the diff
keymap.set("n", "<leader>gww", ":Telescope git_worktree git_worktrees <CR>") -- get the lower version of the diff

-- nvim-tree
keymap.set("n", "<leader>fs", ":NvimTreeToggle<CR>")

-- restart lsp server
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- harpoon
keymap.set("n", "<leader>ha", ':lua require("harpoon.mark").add_file()<CR>') -- add file to harpoon
keymap.set("n", "<leader>hh", ":Telescope harpoon marks<CR>") -- show harpoon menu
-- Hop
keymap.set("n", "<leader> ", ":HopWord<CR>") -- hop to word

-- Neo Tree
keymap.set("n", "\\", ":Neotree toggle reveal_force_cwd <CR>")
keymap.set("n", "<leader>\\b", ":Neotree source=buffers toggle<CR>")
keymap.set("n", "<leader>\\g", ":Neotree source=git_status toggle<CR>")

-- solidity dev env
keymap.set("n", "<leader>fmt", ":!forge fmt<CR>")
keymap.set("n", "<leader>cf", ":!forge fmt<CR>")

-- tree sitter
keymap.set("n", "<leader>ts", ":TSEnable highlight<CR>")

keymap.set("n", "<leader>u", ":UndotreeToggle<CR>")

local wk = require("which-key")

wk.register({

	c = {
		name = "code",
		l = "lazygit",
		a = "lsp code action",
		f = "forge format",
	},
	s = {
		name = "split",
		v = "vertical",
		h = "horizontal",
		x = "close",
		m = "maximize",
		e = "equal size",
		["|"] = "vertical",
		["-"] = "horizontal",
	},
	t = {
		name = "tabs",
		o = "new tab",
		x = "close tab",
		n = "next tab",
		p = "previous tab",
	},
	f = {
		name = "find",
		f = "find files",
		g = "live grep",
		b = "buffers",
		h = "help tags",
		s = "help tags",
	},
	h = {
		name = "harpoon",
		a = "add file",
		h = "harpoon menu",
	},

	g = {
		name = "git",
		l = "LazyGit",
		w = "worktree",
	},
}, { prefix = "<leader>" })
