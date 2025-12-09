vim.cmd [[colorscheme tokyonight]]
local map = vim.keymap.set
local hop = require("hop")
local directions = require("hop.hint").HintDirection
map("", "f", function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, { remap = true })
map("", "F", function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, { remap = true })
map("", "t", function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, { remap = true })
map("", "T", function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, { remap = true })
map("n", "<leader>hw", hop.hint_words, { silent = true, desc = "Hop to Word" })
map("n", "<leader>hl", hop.hint_lines_skip_whitespace, { silent = true, desc = "Hop to Lines" })
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- local vscode = require("")
-- Config
if vim.g.vscode then
  -- Use VSCode native UI
  local vscode = require('vscode')
  map("n", "<leader>ff", function()vscode.action('workbench.action.quickOpen')end)
  map("n", "<leader>fg", function()vscode.action('workbench.action.findInFiles')end)
  map("n", "<leader>e", function()vscode.action('workbench.view.explorer')end)
else
  -- Normal Neovim Telescope
  local telescope = require("telescope")
  telescope.load_extension("file_browser")
  telescope.load_extension("fzy_native")
  local telescope_builtin = require("telescope.builtin")
  map("n", "<leader>ff", telescope_builtin.find_files, { desc = "Telescope find files" })
  map("n", "<leader>fg", telescope_builtin.live_grep, { desc = "Telescope live grep" })
  map("n", "<leader>fb", telescope_builtin.buffers, { desc = "Telescope buffers" })
  map("n", "<leader>fh", telescope_builtin.help_tags, { desc = "Telescope help tags" })
  map('n', '<leader>fr', telescope_builtin.oldfiles, { desc = "Telescope old files" })
  map('n', '<leader>e', telescope.extensions.file_browser.file_browser, { desc = "Telescope file browser" })
end
