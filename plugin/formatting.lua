-- https://github.com/mhartington/formatter.nvim?tab=readme-ov-file
local util = require("formatter.util")

require("formatter").setup({
    logging = true,
    log_level = vim.log.levels.WARN,
    filetype = {
        lua = {
            -- require("formatter.filetypes.lua").stylua,
            function()
                return {
                    exe = "stylua",
                    args = {
                        "--indent-type Spaces",
                        "--search-parent-directories",
                        "--stdin-filepath",
                        util.escape_path(util.get_current_buffer_file_path()),
                        "--",
                        "-",
                    },
                    stdin = true,
                }
            end,
        },
        java = {
            function()
                return {
                    exe = "clang-format",
                    args = {
                        "--assume-filename=.java",
                        [[-style="{BasedOnStyle: Google, IndentWidth: 4, PenaltyBreakComment: 0}"]],
                    },
                    stdin = true,
                }
            end,
        },
        json = {
            require("formatter.filetypes.json").prettierd,
        },
        html = {
            require("formatter.filetypes.html").prettierd,
        },

        ["*"] = {
            require("formatter.filetypes.any").remove_trailing_whitespace,
        },
    },
})

-- format after save
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
    group = "__formatter__",
    command = ":FormatWrite",
})
