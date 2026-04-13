return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		ft = { "markdown" },
		config = function()
			require("render-markdown").setup({
				-- heading = {
				-- 	sign = false,
				-- 	icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
				-- 	width = "full",
				-- },
				-- code = {
				-- 	sign = false,
				-- 	width = "block",
				-- 	right_pad = 1,
				-- },
				-- bullet = {
				-- 	icons = { "●", "○", "◆", "◇" },
				-- },
				-- checkbox = {
				-- 	unchecked = { icon = "󰄱 " },
				-- 	checked = { icon = " " },
				-- },
			})

			-- Brighter heading colors
			vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { fg = "#c780ff", bg = "#1e1030", bold = true })
			vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { fg = "#80d4ff", bg = "#102535", bold = true })
			vim.api.nvim_set_hl(0, "RenderMarkdownH3Bg", { fg = "#8aff80", bg = "#152d15", bold = true })
			vim.api.nvim_set_hl(0, "RenderMarkdownH4Bg", { fg = "#ffe066", bg = "#2d2a10", bold = true })
			vim.api.nvim_set_hl(0, "RenderMarkdownH5Bg", { fg = "#ffb347", bg = "#2d2210", bold = true })
			vim.api.nvim_set_hl(0, "RenderMarkdownH6Bg", { fg = "#ff6e6e", bg = "#2d1a1a", bold = true })

			-- Re-apply after colorscheme changes
			vim.api.nvim_create_autocmd("ColorScheme", {
				callback = function()
					vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { fg = "#c780ff", bg = "#1e1030", bold = true })
					vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { fg = "#80d4ff", bg = "#102535", bold = true })
					vim.api.nvim_set_hl(0, "RenderMarkdownH3Bg", { fg = "#8aff80", bg = "#152d15", bold = true })
					vim.api.nvim_set_hl(0, "RenderMarkdownH4Bg", { fg = "#ffe066", bg = "#2d2a10", bold = true })
					vim.api.nvim_set_hl(0, "RenderMarkdownH5Bg", { fg = "#ffb347", bg = "#2d2210", bold = true })
					vim.api.nvim_set_hl(0, "RenderMarkdownH6Bg", { fg = "#ff6e6e", bg = "#2d1a1a", bold = true })
				end,
			})
		end,
	},
}
