-- define your colorscheme here
local colorscheme = 'solarized-osaka'
--为什么使用局部变量local，而不是去掉local，local是局部变量的意思，虽然然不在某个函数快当中，在体外就代表这作用域全局，也就是这个文件。如果去掉local那么他的作用域是整个lua的环境。
--vim.cmd.colorscheme("kanagawa")应用主题。在plugin中会下载主题。
local is_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not is_ok then
    vim.notify('colorscheme ' .. colorscheme .. ' not found!')
    return
end

