set completeopt=menu,menuone,noselect


lua << EOF
-- Setup nvim-cmp.
-- local WIDE_HEIGHT = 30
local cmp = require'cmp'
cmp.setup(
    {
		snippet = {
    		expand = function(args)
      			luasnip.lsp_expand(args.body)
    		end,
  		},
  		mapping = cmp.mapping.preset.insert({
  			['<C-b>'] = cmp.mapping.scroll_docs(-4),
    		['<C-f>'] = cmp.mapping.scroll_docs(4),
  			['<S-Space>'] = cmp.mapping.complete(),
    		['<CR>'] = cmp.mapping.confirm {
      			behavior = cmp.ConfirmBehavior.Replace,
      			select = true,
    		},
			['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
			['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
  		}),
  		sources = {
    		{ name = 'nvim_lsp' },
    		{ name = 'luasnip' },
  		},
		window = {
			completion = cmp.config.window.bordered(),
		    documentation = cmp.config.window.bordered(),
  		},
    }
)

-- Set configuration for specific filetype.
cmp.setup.filetype(
    "gitcommit",
    {
        sources = cmp.config.sources(
            {
                {name = "cmp_git"} -- You can specify the `cmp_git` source if you were installed it.
            },
            {
                {name = "buffer"}
            }
        )
    }
)

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
--cmp.setup.cmdline(
--    "/",
--    {
--        mapping = cmp.mapping.preset.cmdline(),
--        sources = {
--            {name = "buffer"}
--        }
--    }
--)
--
---- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
--cmp.setup.cmdline(
--    ":",
--    {
--        mapping = cmp.mapping.preset.cmdline(),
--        sources = cmp.config.sources(
--            {
--                {name = "path"}
--            },
--            {
--                {name = "cmdline"}
--            }
--        )
--    }
--)

-- Setup lspconfig.
-- local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- 
-- local servers = { 'pyright', 'rust_analyzer', 'clangd', 'bashls', 'html', 'cssls' }
-- for _, lsp in pairs(servers) do
--    	require('lspconfig')[lsp].setup {
--  		capabilities = capabilities
--      }
-- end
EOF
