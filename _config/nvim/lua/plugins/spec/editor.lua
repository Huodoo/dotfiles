return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>ff",
        function()
          local telescope_builtin = require("telescope.builtin")
          telescope_builtin.find_files()
        end,
        desc = "Telescope find files"
      },
      {
        "<leader>fg",
        function()
          local telescope_builtin = require("telescope.builtin")
          telescope_builtin.live_grep()
        end,
        desc = "Telescope live grep"
      },
      {
        "<leader>fb",
        function()
          local telescope_builtin = require("telescope.builtin")
          telescope_builtin.buffers()
        end,
        desc = "Telescope buffers"
      },
      {
        "<leader>fh",
        function()
          local telescope_builtin = require("telescope.builtin")
          telescope_builtin.help_tags()
        end,
        desc = "Telescope help tags"
      },
      {
        "<leader>fr",
        function()
          local telescope_builtin = require("telescope.builtin")
          telescope_builtin.oldfiles()
        end,
        desc = "Telescope old files"
      },
      {
        "<leader>e",
        function()
          local telescope = require("telescope")
          telescope.extensions.file_browser.file_browser()
        end,
        desc = "Telescope file browser"
      },
    },
    config = function()
      require("telescope").load_extension("fzy_native")
    end,
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
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
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
}
