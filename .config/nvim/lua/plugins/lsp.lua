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
					"ts_ls",
                    "pyright",
                    "sqlls",
                    "marksman",
                    "hyprls",
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
            --Enable (broadcasting) snippet capability for completion
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true

            lspconfig.csharp_ls.setup({})
            lspconfig.lua_ls.setup({})
            lspconfig.html.setup({
                capabilities = capabilities,
            })
            lspconfig.cssls.setup({
                capabilities = capabilities,
            })
            lspconfig.cssmodules_ls.setup({})
            lspconfig.eslint.setup({})
            lspconfig.ts_ls.setup({})
            lspconfig.pyright.setup({})
            lspconfig.sqlls.setup({})
            lspconfig.marksman.setup({})
            lspconfig.hyprls.setup({})
        end,
    }
}

