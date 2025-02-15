local is_ok, configs = pcall(require, "nvim-treesitter.configs")
if not is_ok then
	return
end

configs.setup({
                -- 启用语法高亮
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                -- 启用代码缩进
                indent = {
                    enable = true,
                },
                -- 启用增量选择
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "gnn",
                        node_incremental = "grn",
                        scope_incremental = "grc",
                        node_decremental = "grm",
                    },
                },
                -- 启用基于 Treesitter 的文本对象
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",
                        },
                    },
                },
                -- 确保安装以下语言的语法解析器
                ensure_installed = {
                    "go", "lua", "vim", "bash", "markdown", "json", "yaml", "python", "javascript", "typescript", "html", "css",
                },
            })

