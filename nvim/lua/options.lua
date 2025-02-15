-- 优化neovim Tab UI  searching 用于设置 Neovim 的全局选项（options）。这些选项可以优化 Neovim 的行为、界面和编辑体验。
-- Hint: use `:h <option>` to figure out the meaning if needed
vim.opt.clipboard = 'unnamedplus' -- use system clipboard 可以粘贴了
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' } --补全菜单
vim.opt.mouse = 'a' -- allow the mouse to be used in Nvim

-- Tab
vim.opt.tabstop = 4 -- number of visual spaces per TAB
vim.opt.softtabstop = 4 -- number of spacesin tab when editing
vim.opt.shiftwidth = 4 -- insert 4 spaces on a tab
vim.opt.expandtab = true -- tabs are spaces, mainly because of python

-- UI config 界面配置  行号高亮什么的
vim.opt.number = true -- show absolute number
vim.opt.relativenumber = true -- add numbers to each line on the left side
vim.opt.cursorline = true -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true -- open new vertical split bottom
vim.opt.splitright = true -- open new horizontal splits right
-- vim.opt.termguicolors = true        -- enabl 24-bit RGB color in the TUI
vim.opt.showmode = false -- we are experienced, wo don't need the "-- INSERT --" mode hint

-- Searching
vim.opt.incsearch = true -- search as characters are entered
vim.opt.hlsearch = false -- do not highlight matches
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true -- but make it case sensitive if an uppercase is entered
---这个文件的作用是配置 Neovim 的全局选项，包括：
---剪贴板：与系统剪贴板同步。
---补全：优化代码补全行为。
---鼠标：启用鼠标支持。
---Tab：统一缩进风格。
---界面：提升界面美观性和实用性。
---搜索：优化搜索行为。
