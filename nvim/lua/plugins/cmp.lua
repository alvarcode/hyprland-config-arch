return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip"
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      window = {
        --completion = cmp.config.window.bordered(),
        --documentation = cmp.config.window.bordered(),
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body) -- Expande los snippets
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- LSP autocompletado
        { name = "luasnip" },  -- Snippets
        { name = "buffer" },   -- Texto del buffer actual
        { name = "path" },     -- Rutas de archivos
      })
    })
  end
}

