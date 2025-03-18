return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"onsails/lspkind.nvim"
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		cmp.setup({
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
				winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
				col_offset = -3,
				side_padding = 0,
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body) -- Expande los snippetsend
				end,
			},
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					local lspkind = require("lspkind")

					lspkind.init({
						preset = "codicons",
						symbolmap = {
							Text = '  ',
							Method = '  ',
							Function = '  ',
							Constructor = '  ',
							Field = '  ',
							Variable = '  ',
							Class = '  ',
							Interface = '  ',
							Module = '  ',
							Property = '  ',
							Unit = '  ',
							Value = '  ',
							Enum = '  ',
							Keyword = '  ',
							Snippet = '  ',
							Color = '  ',
							File = '  ',
							Reference = '  ',
							Folder = '  ',
							EnumMember = '  ',
							Constant = '  ',
							Struct = '  ',
							Event = '  ',
							Operator = '  ',
							TypeParameter = '  ',
						},
					})
					local kind = lspkind.cmp_format({
						mode = "symbol_text",
						maxwidth = 50,
					})(entry, vim_item)
					local strings = vim.split(kind.kind, "%s", { trimempty = true })
					kind.kind = (strings[1] or "") .. " |"
					kind.menu = "    | " .. (strings[2] or "")

					return kind
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

