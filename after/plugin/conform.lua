local conform = require("conform")
conform.setup({
	formatters_by_ft = {
		javascript = { { "prettierd" } },
		typescript = { { "prettierd" } },
		typescriptreact = { { "prettierd" } },
		javascriptreact = { { "prettierd" } },
		graphql = { { 'prettierd' } },
		json = { { 'prettierd' } },
		yaml = { { 'prettierd' } }
	},
	format_on_save = {
		lsp_fallback = true,
		timeout_ms = 500
	},
})
vim.keymap.set("n", "<leader>f", conform.format, {})
