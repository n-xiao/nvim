vim.g.mapleader = " "

vim.keymap.set("n", "<leader>jf", vim.cmd.Ex)
vim.keymap.set("n", "K", "<C-u>zz", { silent = true })
vim.keymap.set("n", "J", "<C-d>zz", { silent = true })

vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP actions",
    callback = function(event)
        local opts = { buffer = event.buf }
        -- https://github.com/VonHeikemen/lsp-zero.nvim?tab=readme-ov-file
        vim.keymap.set("n", "gd", function()
            vim.lsp.buf.definition()
        end, opts)

        vim.keymap.set("n", "<C-k>", function()
            vim.lsp.buf.hover()
        end, opts)

        vim.keymap.set("n", "<C-i>", function()
            vim.lsp.buf.implementation()
        end, opts)
    end,
})
