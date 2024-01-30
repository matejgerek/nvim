local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

local lspconfig = require("lspconfig")
require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = { 'eslint' },
	handlers = {
		lsp_zero.default_setup,
		eslint = function()
			lspconfig.eslint.setup({
				on_attach = function(client, bufnr)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						command = "EslintFixAll",
					})
					vim.keymap.set('n', '<leader>l', vim.cmd.EslintFixAll)
				end,
			})
		end
	},
})


local cmp = require("cmp")

cmp.setup({
	preselect = 'item',
	completion = {
		completeopt = 'menu,menuone,noinsert'
	},
	mapping = cmp.mapping.preset.insert({
		['<CR>'] = cmp.mapping.confirm({ select = false }),
	})
})
