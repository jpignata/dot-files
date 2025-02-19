-- luacheck: globals vim

require("config.lazy")

require("lazy").setup {
  spec = {
    "EdenEast/nightfox.nvim",
    "dense-analysis/ale",
    "github/copilot.vim",
    "nvim-lualine/lualine.nvim",
    "nvim-telescope/telescope-fzf-native.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-tree/nvim-tree.lua",
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
}

require("nvim-treesitter.configs").setup {
    ensure_installed = "all",
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    },
}

require("nvim-tree").setup {
  git = {
    ignore = false,
  },
  filters = {
    custom = { ".git" },
  },
}

require("lualine").setup {
  options = {
    disabled_filetypes = {
      winbar = { "NvimTree" },
      statusline = { "NvimTree" },
    },
    refresh = {
      statusline = 200,
      tabline = 200,
      winbar = 200,
    }
  }
}

local telescope = require("telescope.builtin")
local nvim_tree = require("nvim-tree.api")
local clear_search = function()
  vim.cmd("nohlsearch")
end

vim.keymap.set("n", "<leader>f", telescope.find_files, {})
vim.keymap.set("n", "<leader>g", telescope.live_grep, {})
vim.keymap.set("n", "<leader>n", nvim_tree.tree.toggle, {})
vim.keymap.set("n", "<leader>/", clear_search, {})

vim.opt.termguicolors = true

vim.o.autoindent = true
vim.o.clipboard = "unnamedplus"
vim.o.expandtab = true
vim.o.foldcolumn = "1"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldlevel = 99
vim.o.foldmethod = "expr"
vim.o.number = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.smarttab = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.ale_fix_on_save = 1
vim.g.ale_use_global_executables = 0
vim.g.ale_completion_enabled = 1

vim.g.ale_fixers = {
  default = {
    "remove_trailing_lines",
    "trim_whitespace"
  },
  javascript = {
    "eslint",
    "prettier"
  },
  typescript = {
    "eslint",
    "prettier"
  },
  typescriptreact = {
    "eslint",
    "prettier"
  },
  python = {
    "isort",
    "black"
  },
}

vim.cmd("colorscheme nightfox")
