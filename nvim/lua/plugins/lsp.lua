return {
    -- LPS, Linters and formatters instaler
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    --LSPConfig and Mason conexion
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "csharp_ls",
                    "lua_ls",
                    "html",
                    "cssls",
                    "cssmodules_ls",
                    "eslint",
                    "pyright",
                    "sqlls",
                    "marksman",
                },
            })
        end,
    },
    -- LSP configuration
    {
        "neovim/nvim-lspconfig",
        dependencies = { "williamboman/mason-lspconfig.nvim" },
        config = function()
            local lspconfig = require("lspconfig")

            lspconfig.csharp_ls.setup({})
            lspconfig.lua_ls.setup({})
            lspconfig.html.setup({})
            lspconfig.cssls.setup({})
            lspconfig.cssmodules_ls.setup({})
            lspconfig.eslint.setup({})
            lspconfig.pyright.setup({})
            lspconfig.sqlls.setup({})
            lspconfig.marksman.setup({})
        end,
    }
}

