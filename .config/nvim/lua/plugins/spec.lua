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
  }
}
