local M = {}

function M.setup()
	local cmp = require("cmp")
	local luasnip = require("luasnip")
	local lspkind = require("lspkind")

	cmp.setup({
		preselect = cmp.PreselectMode.None,

		completion = {
			completeopt = "menu,menuone,noinsert",
		},

		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},

		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},

		mapping = cmp.mapping.preset.insert({
			["<C-Space>"] = cmp.mapping.complete(),

			["<C-e>"] = cmp.mapping.abort(),

			["<CR>"] = cmp.mapping.confirm({
				select = false,
			}),

			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				else
					fallback()
				end
			end, { "i", "s" }),

			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),

			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
		}),

		sources = cmp.config.sources({
			{
				name = "nvim_lsp",
				priority = 1000,
			},
			{
				name = "nvim_lsp_document_symbol",
				priority = 900,
			},

			{
				name = "luasnip",
				priority = 750,
			},

			{
				name = "path",
				priority = 500,
			},

			{
				name = "buffer",
				priority = 250,
			},
		}),

		formatting = {
			format = lspkind.cmp_format({
				mode = "symbol_text",
				maxwidth = 50,

				menu = {
					nvim_lsp = "[LSP]",
					luasnip = "[Snippet]",
					buffer = "[Buffer]",
					path = "[Path]",
				},
			}),
		},

		experimental = {
			ghost_text = true,
		},

		sorting = {
			priority_weight = 2,
			comparators = {
				cmp.config.compare.offset,
				cmp.config.compare.exact,
				cmp.config.compare.score,
				cmp.config.compare.kind,
				cmp.config.compare.sort_text,
				cmp.config.compare.length,
				cmp.config.compare.order,
			},
		},
	})

	----------------------------------------------------------
	-- Search (/)
	----------------------------------------------------------

	cmp.setup.cmdline("/", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})

	----------------------------------------------------------
	-- Command (:)
	----------------------------------------------------------

	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),

		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	})
end

return M
