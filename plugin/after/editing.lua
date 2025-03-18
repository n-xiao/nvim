vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4
vim.opt.cursorline = true -- makes current line orange
vim.opt.cursorlineopt = "number" -- only shows selected line

vim.opt.clipboard = "unnamedplus" -- use sys clipboard

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true -- use space instead of tab

-- indent-blankline config
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
