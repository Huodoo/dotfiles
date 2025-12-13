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
    "smoka7/hop.nvim",
    opts = {},
    keys = {
      {
        "f",
        function()
          local hop = require("hop")
          local directions = require("hop.hint").HintDirection
          hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
        end,
      },
      {
        "F",
        function()
          local hop = require("hop")
          local directions = require("hop.hint").HintDirection
          hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
        end,
      },
      {
        "t",
        function()
          local hop = require("hop")
          local directions = require("hop.hint").HintDirection
          hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
        end,
      },
      {
        "T",
        function()
          local hop = require("hop")
          local directions = require("hop.hint").HintDirection
          hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
        end,
      },
      {
        "<leader>hw",
        function()
          local hop = require("hop")
          hop.hint_words()
        end,
        silent = true,
        desc = "Hop to Word"
      },
      {
        "<leader>hl",
        function()
          local hop = require("hop")
          hop.hint_lines_skip_whitespace()
        end,
        silent = true,
        desc = "Hop to Line"
      },
    },
  },
  { "kylechui/nvim-surround",                     opts = {},  event = "VeryLazy" },
  { "nvim-lua/plenary.nvim",                      lazy = true },
  { "nvim-tree/nvim-web-devicons",                lazy = true },
  { "nvim-telescope/telescope-file-browser.nvim", lazy = true },
  { "nvim-telescope/telescope-fzy-native.nvim",   lazy = true }
}
