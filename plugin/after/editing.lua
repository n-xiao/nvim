vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 1
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

vim.opt.clipboard = "unnamedplus" -- use sys clipboard

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

local scope_line = "│"

local ibl_opts = {
    indent = {
        char = scope_line,
    },
    scope = {
        enabled = false,
    },
}

require("ibl").setup(ibl_opts)

vim.api.nvim_create_autocmd("User", {
    callback = function()
        local indent_opts = {
            symbol = scope_line,
        }

        require("mini.indentscope").setup(indent_opts)
        require("statusbar")
    end,
    pattern = "AlphaClosed",
})
