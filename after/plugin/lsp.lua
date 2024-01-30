local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end)


require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = { 'tsserver' },
	handlers = {
		lsp_zero.default_setup,
		require("lspconfig").tsserver.setup({
			on_init = function(client)
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentFormattingRangeProvider = false
			end,

		})
	},
})

local conform = require("conform")
conform.setup({
	formatters_by_ft = {
		javascript = { { "prettierd" } },
		typescript = { { "prettierd" } },
		typescriptreact = { { "prettierd" } },
		javascriptreact = { { "prettierd" } },
	},
	format_on_save = {
		lsp_fallback = true,
		timeout_ms = 500
	},
})
vim.keymap.set("n", "<leader>f", conform.format, {})
