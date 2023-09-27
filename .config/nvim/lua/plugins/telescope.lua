return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "kkharji/sqlite.lua",
    { "prochri/telescope-all-recent.nvim", opts = {} },
    "AckslD/nvim-neoclip.lua",
    "danielvolchek/tailiscope.nvim",
    "debugloop/telescope-undo.nvim",
    "natecraddock/telescope-zf-native.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "ThePrimeagen/harpoon",
    "joshmedeski/telescope-smart-goto.nvim",
    "piersolenski/telescope-import.nvim",
  },
  -- apply the config and additionally load fzf-native
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    telescope.load_extension("harpoon")
    telescope.load_extension("fzf")
    telescope.load_extension("import")
    telescope.load_extension("neoclip")
    -- telescope.load_extension("notify")
    -- telescope.load_extension("smart_goto")
    telescope.load_extension("tailiscope")
    telescope.load_extension("undo")
    telescope.load_extension("zf-native")
  end,

  opts = {
    defaults = {
      file_ignore_patterns = { ".git/", "node_modules" },
      layout_config = {
        --height = 0.90,
        --width = 0.90,
        --preview_cutoff = 0,
        --horizontal = { preview_width = 0.60 },
        --vertical = { width = 0.55, height = 0.9, preview_cutoff = 0 },
        --prompt_position = "top",
      },
      path_display = { "smart" },
      prompt_position = "top",
      prompt_prefix = " ",
      selection_caret = " ",
      sorting_strategy = "ascending",
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--hidden",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--trim", -- add this value
      },
    },
    pickers = {
      buffers = {
        prompt_prefix = "󰸩 ",
      },
      commands = {
        prompt_prefix = " ",
        layout_config = {
          height = 0.63,
          width = 0.78,
        },
      },
      command_history = {
        prompt_prefix = " ",
        layout_config = {
          height = 0.63,
          width = 0.58,
        },
      },
      git_files = {
        prompt_prefix = "󰊢 ",
        show_untracked = true,
      },
      find_files = {
        prompt_prefix = " ",
        find_command = { "fd", "-H" },
      },
      live_grep = {
        prompt_prefix = "󰱽 ",
      },
      grep_string = {
        prompt_prefix = "󰱽 ",
      },
    },
    extensions = {
      command_palette = {
        { "Open", { "Open File in GitHub", ":OpenInGHFile" } },
        {
          "File",
          { "entire selection (C-a)", ':call feedkeys("GVgg")' },
          { "save current file (C-s)", ":w" },
          { "save all files (C-A-s)", ":wa" },
          { "quit (C-q)", ":qa" },
          { "file browser (C-i)", ":lua require'telescope'.extensions.file_browser.file_browser()", 1 },
          { "search word (A-w)", ":lua require('telescope.builtin').live_grep()", 1 },
          { "git files (A-f)", ":lua require('telescope.builtin').git_files()", 1 },
          { "files (C-f)", ":lua require('telescope.builtin').find_files()", 1 },
        },
        {
          "Help",
          { "tips", ":help tips" },
          { "cheatsheet", ":help index" },
          { "tutorial", ":help tutor" },
          { "summary", ":help summary" },
          { "quick reference", ":help quickref" },
          { "search help(F1)", ":lua require('telescope.builtin').help_tags()", 1 },
        },
        {
          "Vim",
          { "reload vimrc", ":source $MYVIMRC" },
          { "check health", ":checkhealth" },
          { "jumps (Alt-j)", ":lua require('telescope.builtin').jumplist()" },
          { "commands", ":lua require('telescope.builtin').commands()" },
          { "command history", ":lua require('telescope.builtin').command_history()" },
          { "registers (A-e)", ":lua require('telescope.builtin').registers()" },
          { "colorshceme", ":lua require('telescope.builtin').colorscheme()", 1 },
          { "vim options", ":lua require('telescope.builtin').vim_options()" },
          { "keymaps", ":lua require('telescope.builtin').keymaps()" },
          { "buffers", ":Telescope buffers" },
          { "search history (C-h)", ":lua require('telescope.builtin').search_history()" },
          { "paste mode", ":set paste!" },
          { "cursor line", ":set cursorline!" },
          { "cursor column", ":set cursorcolumn!" },
          { "spell checker", ":set spell!" },
          { "relative number", ":set relativenumber!" },
          { "search highlighting (F12)", ":set hlsearch!" },
        },
      },
      ["zf-native"] = {
        file = { -- options for sorting file-like items
          enable = true, -- override default telescope file sorter
          highlight_results = true, -- highlight matching text in results
          match_filename = true, -- enable zf filename match priority
        },
        generic = { -- options for sorting all other items
          enable = true, -- override default telescope generic item sorter
          highlight_results = true, -- highlight matching text in results
          match_filename = false, -- disable zf filename match priority
        },
      },
    },
  },
  keys = function()
    return {
      { "<leader>*", "<cmd>Telescope grep_string<cr>", { silent = true, desc = "Grep Word Under Cursor" } },
    }
  end,
}
