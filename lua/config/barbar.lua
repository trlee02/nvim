local keyset = vim.keymap.set
local opts = { noremap = true, silent = true }
keyset('n', '<M-r>', '<Cmd>BufferRestore<CR>', opts)
