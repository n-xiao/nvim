require("nvim-treesitter.configs").setup({ highlight = { enable = true } })

vim.cmd([[
let g:gitgutter_sign_added = '▍'
let g:gitgutter_sign_modified = '▍'
let g:gitgutter_sign_removed = '▍'
let g:gitgutter_sign_removed_first_line = '▍'
let g:gitgutter_sign_removed_above_and_below = '▍'
let g:gitgutter_sign_modified_removed = '▍'
]])

vim.opt.showmode = false -- hides the stupid default --status--
require("nvim-autopairs").setup({})
