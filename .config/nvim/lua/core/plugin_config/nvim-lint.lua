require("lint").linters_by_ft = {
	markdown = { "vale" },
	javascript = { "eslint_d" },
	typescript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	typescriptreact = { "eslint_d" },
	svelte = { "eslint_d" },
	python = { "pylint" },
	yaml = { "yamllint" },
	json = { "jsonlint" },
	html = { "tidy" },
	go = { "golangci_lint" },
	cpp = { "clang-tidy" },
	c = { "clang-tidy" },
	java = { "checkstyle" },
	kotlin = { "ktlint" },
	bash = { "shellcheck" },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	callback = function()
		require("lint").try_lint()
	end,
})

vim.keymap.set("n", "<leader>l", function()
	require("lint").try_lint()
end, { desc = "Trigger linting for current file" })
