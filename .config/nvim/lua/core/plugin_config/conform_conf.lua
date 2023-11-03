require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		javascript = { { "prettierd", "prettier" } },
		javascriptreact = { { "prettierd", "prettier" } },
		typescript = { { "prettierd", "prettier" } },
		typescriptreact = { { "prettierd", "prettier" } },
		svelte = { { "prettierd", "prettier" } },
		html = { { "prettierd", "prettier" } },
		css = { { "prettierd", "prettier" } },
		json = { { "prettierd", "prettier" } },
		markdown = { { "prettierd", "prettier" } },
		yaml = { { "prettierd", "prettier" } },
		graphql = { { "prettierd", "prettier" } },
		go = { { "gofmt" } },
		cpp = { { "clang_format" } },
		c = { { "clang_format" } },
		java = { { "astyle" } },
		kotlin = { { "ktlint" } },
		bash = { { "shfmt" } },
	},

	format_on_save = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	},
})

vim.keymap.set({ "n", "v" }, "<leader>mp", function()
	require("conform").format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	})
end, { desc = "Format file or range (in visual mode)" })
