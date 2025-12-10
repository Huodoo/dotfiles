return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = {
      transparent = true
    }
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "tokyonight"
      }
    }
  },
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {}
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}
  },
  { "folke/trouble.nvim", opts = {} },
  {
    "akinsho/toggleterm.nvim",
    opts = {}
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true
    }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = {
        enable = true
      },
      incremental_selection = {
        enable = true
      },
      indent = {
        enable = true
      },
    },
    main = "nvim-treesitter.configs",
    build = ":TSUpdate" 
  },
  { "neovim/nvim-lspconfig" },
  { "mason-org/mason.nvim", opts = {} },
  { "mason-org/mason-lspconfig.nvim", opts = {} },
}
