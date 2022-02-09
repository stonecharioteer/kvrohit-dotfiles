local opts = { noremap = true, silent = true }

-- general
vim.api.nvim_set_keymap("n", "<Leader>d", ":bd<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>s", ":w<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>qn", ":cnext<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>qp", ":cprevious<CR>", opts)
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", opts)
vim.api.nvim_set_keymap("n", "<Leader>fs", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>fs", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>:w<CR>", opts)

-- nvim-tasks
vim.api.nvim_set_keymap("n", "<Leader>tt", ":ToggleTask<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>tc", ":CancelTask<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>td", ":UndoTask<CR>", opts)

-- nvim-tree
vim.api.nvim_set_keymap('n', '<Leader>n', ':NvimTreeToggle<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>ft', ':NvimTreeFindFile<CR>', opts)

-- telescope
vim.api.nvim_set_keymap('n', '<Leader>tbb', ':Telescope buffers<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>tff', ':Telescope find_files<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>tgf', ':Telescope git_files<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>tlg', ':Telescope live_grep<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>tfb', "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>", opts)
vim.api.nvim_set_keymap('n', '<Leader>ttt', ':Telescope<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>tts', ':Telescope treesitter<CR>', opts)

-- buffers
vim.api.nvim_set_keymap("n", "<Left>", ":BufPrev<CR>", opts)
vim.api.nvim_set_keymap("n", "<Right>", ":BufNext<CR>", opts)

-- auto commands
vim.cmd [[autocmd TermOpen * setlocal nonu nornu]]
vim.cmd [[au TextYankPost * lua vim.highlight.on_yank {on_visual = false}]]

vim.api.nvim_set_keymap('n', '<C-h>', '<C-w><C-h>', opts)
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w><C-j>', opts)
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w><C-k>', opts)
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w><C-l>', opts)

-- folke/trouble
vim.api.nvim_set_keymap('n', '<Leader>trt', ':TroubleToggle<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>trr', ':TroubleRefresh<CR>', opts)

