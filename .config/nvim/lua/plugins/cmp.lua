
local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
	return
end


return {




	{"hrsh7th/nvim-cmp",
  			dependencies = {"L3MON4D3/LuaSnip" },
  },
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-nvim-lsp",
}
