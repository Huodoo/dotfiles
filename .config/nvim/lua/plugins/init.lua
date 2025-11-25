return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
            ["<Esc>"] = "close",
          },
          n = { ["q"] = "close" },
        },
      },
      extensions = {
        file_browser = {},
        fzy_native = {}
      },
    },
  },
  { "smoka7/hop.nvim",             opts = {} },
  { "kylechui/nvim-surround",      opts = {},  event = "VeryLazy" },
  { "nvim-lua/plenary.nvim",       lazy = true },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  { "nvim-telescope/telescope-file-browser.nvim", lazy = true },
  { "nvim-telescope/telescope-fzy-native.nvim", lazy = true }
}
