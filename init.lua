vim.opt.runtimepath:prepend(vim.fn.stdpath("data") .. "/plugged/nvim-treesitter/parser") -- load tree sitter parsers before nvim's

local vim = vim
local Plug = vim.fn["plug#"]

vim.call("plug#begin")

Plug("rebelot/kanagawa.nvim")
Plug("neovim/nvim-lspconfig")
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/cmp-path")
Plug("hrsh7th/cmp-cmdline")
Plug("hrsh7th/nvim-cmp")

Plug("hrsh7th/cmp-vsnip")
Plug("hrsh7th/vim-vsnip")

Plug("mfussenegger/nvim-jdtls") -- special because java

Plug("natecraddock/workspaces.nvim")
Plug("nvim-lua/plenary.nvim")
Plug("nvim-telescope/telescope.nvim", { ["tag"] = "0.1.8" })

Plug("nvim-tree/nvim-web-devicons")

Plug("airblade/vim-gitgutter")
Plug("lukas-reineke/indent-blankline.nvim")
Plug("echasnovski/mini.indentscope", { ["branch"] = "stable" })

Plug("mhartington/formatter.nvim")

Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" })

Plug("windwp/nvim-autopairs")

Plug("goolord/alpha-nvim")
Plug("nvim-lualine/lualine.nvim")

vim.call("plug#end")

require("startup")
