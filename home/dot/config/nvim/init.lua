-- luacheck: globals vim

require("config.lazy")

require("lazy").setup {
  spec = {
    "EdenEast/nightfox.nvim",
    "dense-analysis/ale",
    "nvim-lualine/lualine.nvim",
    "neovim/nvim-lspconfig",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope.nvim",
    {
      "sindrets/diffview.nvim",
      dependencies = "nvim-lua/plenary.nvim",
      config = function()
        require("diffview").setup {
          use_icons = false,
        }
      end,
    },
    {
      "nvim-treesitter/nvim-treesitter",
      branch = "main",
      lazy = false,
      build = function()
        require("nvim-treesitter").install({
          "css",
          "html",
          "javascript",
          "json",
          "lua",
          "markdown",
          "markdown_inline",
          "python",
          "query",
          "tsx",
          "typescript",
          "vim",
          "vimdoc",
          "yaml",
        }):wait(300000)
      end,
      config = function()
        require("nvim-treesitter").install({
          "css",
          "html",
          "javascript",
          "json",
          "lua",
          "markdown",
          "markdown_inline",
          "python",
          "query",
          "tsx",
          "typescript",
          "vim",
          "vimdoc",
          "yaml",
        })

        vim.api.nvim_create_autocmd("FileType", {
          pattern = {
            "css",
            "html",
            "javascript",
            "json",
            "lua",
            "markdown",
            "python",
            "query",
            "typescript",
            "typescriptreact",
            "vim",
            "help",
            "yaml",
          },
          callback = function()
            pcall(vim.treesitter.start)
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end,
        })
      end,
    },
    "nvim-tree/nvim-tree.lua",
  },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
}

vim.lsp.config("basedpyright", {
  settings = {
    basedpyright = {
      analysis = {
        typeCheckingMode = "basic",
      },
    },
  },
})
vim.lsp.enable("basedpyright")

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
local open_diffview = function()
  vim.cmd("DiffviewOpen")
end
local open_staged_diffview = function()
  vim.cmd("DiffviewOpen --staged")
end
local close_diffview = function()
  vim.cmd("DiffviewClose")
end

vim.api.nvim_create_user_command("Dq", close_diffview, {})

vim.keymap.set("n", "<leader>c", vim.lsp.buf.incoming_calls, {})
vim.keymap.set("n", "<leader>f", telescope.find_files, {})
vim.keymap.set("n", "<leader>g", telescope.live_grep, {})
vim.keymap.set("n", "<leader>n", nvim_tree.tree.toggle, {})
vim.keymap.set("n", "<leader>/", clear_search, {})
vim.keymap.set("n", "<leader>d", open_diffview, {})
vim.keymap.set("n", "<leader>D", open_staged_diffview, {})
vim.keymap.set("n", "<leader>q", close_diffview, {})

vim.opt.termguicolors = true

vim.o.autoindent = true
vim.o.clipboard = "unnamedplus"
vim.o.expandtab = true
vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldmethod = "manual"
vim.o.number = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.smarttab = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.ale_fix_on_save = 1
vim.g.ale_use_global_executables = 1
vim.g.ale_completion_enabled = 1

vim.g.ale_linters = {
  python = {
    "pyflakes"
  },
}

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
