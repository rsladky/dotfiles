return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
		"jayp0521/mason-null-ls.nvim", -- ensure dependencies are installed
	},
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting

		-- Formatters & linters for mason to install
		require("mason-null-ls").setup({
			ensure_installed = {
				"stylua", -- Lua formatter
				"ruff",   -- Python linter + formatter
				-- rustfmt is managed by rustup, not Mason; rust_analyzer handles Rust formatting
			},
			automatic_installation = true,
		})

		local sources = {
			-- Lua
			formatting.stylua,

			-- Python (ruff handles both linting and formatting)
			require("none-ls.diagnostics.ruff"),
			require("none-ls.formatting.ruff_format"),

			-- Note: Rust (rustfmt), C/C++ (clang-format), and Go (gofmt) formatting
			-- are handled directly by their LSP servers.
		}

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		null_ls.setup({
			-- debug = true, -- Enable debug mode. Inspect logs with :NullLsLog.
			sources = sources,
			-- you can reuse a shared lspconfig on_attach callback here
			on_attach = function(client, bufnr)
				if client:supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ async = false })
						end,
					})
				end
			end,
		})
	end,
}
