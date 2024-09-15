return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			-- svelte = { "eslint_d" },
			-- python = { "pylint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
		-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
		-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
		-- 	group = lint_augroup,
		-- 	callback = function()
		-- 		lint.try_lint()
		-- 		vim.diagnostic.hide()
		-- 	end,
		-- })

		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })

		vim.keymap.set("n", "<leader>ld", function()
			-- local ns = lint.get_namespace("eslint_d")
			-- vim.diagnostic.config({ virtual_text = false }, ns)
			vim.diagnostic.hide()
		end, { desc = "Hide linting diagnostic" })

		vim.keymap.set("n", "<leader>lo", function()
			lint.try_lint()
			-- local ns = lint.get_namespace('eslint_d')
			-- vim.diagnostic.config({virtual_text = true}, ns)
			-- vim.diagnostic.show()
		end, { desc = "Show linting diagnostic" })
	end,
}
