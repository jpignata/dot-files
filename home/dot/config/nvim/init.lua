require("config.lazy")

require("lazy").setup {
  spec = {
    "EdenEast/nightfox.nvim",
    "github/copilot.vim",
    "nvim-lualine/lualine.nvim",
    "nvim-telescope/telescope-fzf-native.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-tree/nvim-tree.lua",
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "psf/black",
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

vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
vim.keymap.set("n", "<leader>f", ":Telescope find_files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>g", ":Telescope live_grep<CR>", { desc = "Live grep" })

vim.opt.termguicolors = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.o.autoindent = true
vim.o.clipboard = "unnamedplus"
vim.o.expandtab = true
vim.o.foldcolumn = "1"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldlevel = 99
vim.o.foldmethod = "expr"
vim.o.number = true
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.smarttab = true

vim.cmd("colorscheme nightfox")
