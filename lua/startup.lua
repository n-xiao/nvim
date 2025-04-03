-- runs at end of init.lua
require("nvim-treesitter.configs").setup({ highlight = { enable = true } })

vim.cmd([[
let g:gitgutter_sign_added = '▍'
let g:gitgutter_sign_modified = '▍'
let g:gitgutter_sign_removed = '▍'
let g:gitgutter_sign_removed_first_line = '▍'
let g:gitgutter_sign_removed_above_and_below = '▍'
let g:gitgutter_sign_modified_removed = '▍'

let g:vimtex_view_method = 'skim'
let g:vimtex_compiler_method = 'tectonic'
let g:vimtex_imaps_leader = '@'
]])

vim.opt.showmode = false -- hides the stupid default --status--
require("nvim-autopairs").setup({})
