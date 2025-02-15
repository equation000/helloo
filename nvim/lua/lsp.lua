---LSP 是 Language Server Protocol（语言服务器协议）的缩写，它是一种由微软开发的标准化协议，用于在编辑器或 IDE 与语言服务器之间进行通信。LSP 的主要目的是为编程语言提供智能化的功能（如代码补全、语法检查、跳转到定义、重构等），而无需为每个编辑器或 IDE 单独实现这些功能。
---gopls 是 Go 语言的 LSP 实现支持的常见功能包括：代码补全.语法检查.跳转到定义.查找引用.重命名符号.代码格式化.悬停提示（显示文档）
---下面的快捷键映射都是实现gopls的各种功能。
require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require('mason-lspconfig').setup({
    -- A list of servers to automatically install if they're not already installed
    ensure_installed = {'gopls'},
})
-- Set different settings for different languages' LSP
-- LSP list: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- How to use setup({}): https://github.com/neovim/nvim-lspconfig/wiki/Understanding-setup-%7B%7D
--     - the settings table is sent to the LSP
--     - on_attach: a lua callback function to run after LSP atteches to a given buffer
local lspconfig = require('lspconfig')

-- Customized on_attach function
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "<space>fo", function()
        vim.lsp.buf.format({ async = true })
    end, bufopts)
end

-- Configure each language
-- How to add LSP for a specific language?
-- 1. use `:Mason` to install corresponding LSP
-- 2. add configuration below
lspconfig.gopls.setup({
	on_attach = on_attach,
	capabilities = require('cmp_nvim_lsp').default_capabilities(), -- 启用补全功能
    settings = {
        gopls = {
            analyses = {
                unusedparams = true, -- 检查未使用的参数
                unusedwrite = true,  -- 检查未使用的变量写入
                nilness = true,      -- 检查 nil 相关的错误
            },
            staticcheck = true,      -- 启用 staticcheck
            codelenses = {
                generate = true,     -- 显示生成代码的镜头
                gc_details = true,   -- 显示 GC 详细信息
            },
            usePlaceholders = true,  -- 在补全时使用占位符
            completeUnimported = true, -- 补全未导入的包
        },
    },
})
