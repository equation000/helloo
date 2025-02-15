-- keymaps 定义了窗口大小，窗口移动。visual模式下选中文本进行<>移动tab个单位。
-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true      -- do not show message
}
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set('i', '<D-v>', '<C-r>+', { noremap = true, silent = true }) -- 插入模式粘贴
vim.keymap.set('n', '<D-v>', '"+p', { noremap = true, silent = true }) -- 普通模式粘贴
vim.keymap.set('v', '<D-c>', '"+y', { noremap = true, silent = true }) -- 视觉模式复制
vim.keymap.set('v', '<D-v>', '"+p', { noremap = true, silent = true }) -- 视觉模式粘贴

-----------------
-- Normal mode --
-----------------

-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)


-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)
---nvim-tree yingshe 
---删了 待增加
vim.keymap.set("n", "<space>a", ":NvimTreeToggle<CR>", opts)
