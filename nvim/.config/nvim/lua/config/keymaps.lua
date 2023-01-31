local Util = require("util")

-- better up/down
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- move lines
vim.keymap.set("n", "<A-j>", ":m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("n", "<A-k>", ":m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<cr>==gi", { desc = "Move up" })

-- buffers
if not Util.has("bufferline.nvim") then
  vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
  vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
end

-- clear search with <esc>
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- saner behavior of n and N
vim.keymap.set("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- save file
vim.keymap.set({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- lazy
vim.keymap.set("n", "<leader>l", "<cmd>:Lazy<cr>", { desc = "Lazy" })

-- new file
vim.keymap.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New file" })

-- open lists
vim.keymap.set("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Open location list" })
vim.keymap.set("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Open quickfix list" })

-- toggle options
vim.keymap.set("n", "<leader>uf", require("plugins.lsp.format").toggle, { desc = "Toggle format on Save" })
vim.keymap.set("n", "<leader>uw", function() Util.toggle("wrap") end, { desc = "Toggle word wrap" })
vim.keymap.set("n", "<leader>ud", Util.toggle_diagnostics, { desc = "Toggle diagnostics" })

-- lazygit
vim.keymap.set("n", "<leader>gg", function() Util.float_term({ "lazygit" }) end, { desc = "Lazygit (cwd)" })
vim.keymap.set("n", "<leader>gG", function() Util.float_term({ "lazygit" }, { cwd = Util.get_root() }) end, { desc = "Lazygit (root dir)" })

-- quit
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- highlights under cursor
if vim.fn.has("nvim-0.9.0") == 1 then
  vim.keymap.set("n", "<leader>sH", vim.show_pos, { desc = "Highlight groups at cursor" })
end

-- floating terminal
vim.keymap.set("n", "<leader>ft", function() Util.float_term() end, { desc = "Terminal (cwd)" })
vim.keymap.set("n", "<leader>fT", function() Util.float_term(nil, { cwd = Util.get_root() }) end, { desc = "Terminal (root dir)" })
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", {desc = "Enter normal mode"})

-- windows
vim.keymap.set("n", "<leader>ww", "<C-W>p", { desc = "Other window" })
vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete window" })
vim.keymap.set("n", "<leader>w-", "<C-W>s", { desc = "Split window below" })
vim.keymap.set("n", "<leader>w|", "<C-W>v", { desc = "Split window right" })

-- tabs
vim.keymap.set("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last tab" })
vim.keymap.set("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First tab" })
vim.keymap.set("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New tab" })
vim.keymap.set("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next tab" })
vim.keymap.set("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close tab" })
vim.keymap.set("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous tab" })
