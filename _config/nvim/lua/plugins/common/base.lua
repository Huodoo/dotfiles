return {
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
