local function disabled_in_vscode()
  return not vim.g.vscode
end

return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        transparent = true, 
      })
      vim.cmd[[colorscheme tokyonight]]
    end,
    cond = disabled_in_vscode,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {},
    cond = disabled_in_vscode,
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "tokyonight"
      },
    },
    cond = disabled_in_vscode,
  },
  {
    "smoka7/hop.nvim",
    opts = {},
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
    cond = disabled_in_vscode,
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
  },
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {},
  },
  { "nvim-lua/plenary.nvim", lazy = true },
  { "nvim-tree/nvim-web-devicons", lazy = true },
}
