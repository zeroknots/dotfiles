vim.cmd("let g:gitblame_enabled = 0")
return {
	"f-person/git-blame.nvim",
  config = function(_,opts)
    local gitblame = require("gitblame")
    gitblame.setup(opts)
  end,
  opts = {
	  enabled = false,
    lazy = true
  }
}
