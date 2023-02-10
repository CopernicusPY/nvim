local function map(mode, key, command, opts)
  opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
  vim.keymap.set(mode, key, command, opts)
end
-- Telescope
local builtin = ":lua require('telescope.builtin')"

map("n", "ff",  builtin .. ".find_files()<CR>")
map("n", "fg", builtin .. ".live_grep()<CR>")
map("n", "fb", builtin .. ".buffers()<CR>")
map("n", "fh", builtin .. ".help_tags<CR>")
-- Todo navigation
local builtin = "lua require('todo-comments')"

map("n", "]t", builtin .. ".jump_next()<CR>")
map("n", "[t", builtin .. ".jump_prev()<CR>")
-- Tab navigation
map("n", "th",  ":tabfirst<CR>")
map("n", "tk",  ":tabprev<CR>")
map("n", "tj",  ":tabnext<CR>")
map("n", "tl", ":tablast<CR>")

map("n", "tn", ":tabnew<CR>")
map("n", "td", ":tabclose<CR>")

-- File navigation
map("n", "tt", ":lua require('nvim-tree.api').tree.toggle()<CR>", { desc = "[t]ree [t]oggle" })
map("n", "tf", ":lua require('nvim-tree.api').tree.focus()<CR>", { desc = "[t]ree [f]ocus" })
