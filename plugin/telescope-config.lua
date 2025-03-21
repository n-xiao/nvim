local telescope_builtin = require("telescope.builtin")
local telescope = require("telescope")
require("workspaces").setup({
    hooks = {
        open = { "Telescope find_files" },
    },
})

telescope.load_extension("workspaces")

-- layout config
telescope.setup({
    defaults = {
        layout_strategy = "vertical",
        layout_config = { height = 0.85, width = 0.60 },
    },
})

vim.keymap.set("n", "<leader>f", function()
    telescope_builtin.find_files()
end, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>w", function()
    telescope.extensions.workspaces.workspaces()
end, { desc = "Telescope find workspaces" })
vim.keymap.set("n", "<leader>m", function()
    telescope_builtin.lsp_document_symbols()
end, { desc = "Telescope list doc symbols" })
