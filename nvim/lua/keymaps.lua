-- ------------------ --
-- Lua code execution --
-- ------------------ --

-- E(x)ecute the entire Lua (f)ile
vim.keymap.set("n", "<space>xf", "<cmd>source %<CR>")
-- E(x)ecute the Lua (l)ine you're currently on
vim.keymap.set("n", "<space>xl", ":.lua<CR>")
-- E(x)ecute the Lua (r)egion selected in visual mode
vim.keymap.set("v", "<space>xr", ":lua<CR>")

-- kickstart
-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
