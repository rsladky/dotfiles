return {
	"nvim-mini/mini.nvim",
	config = function()
		-- Better Around/Inside textobjects
		--
		-- Examples:
		--  - va)  - [V]isually select [A]round [)]paren
		--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
		--  - ci'  - [C]hange [I]nside [']quote
		require("mini.ai").setup({ n_lines = 500 })

		-- Add/delete/replace surroundings (brackets, quotes, etc.)
		--
		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
		-- - sd'   - [S]urround [D]elete [']quotes
		-- - sr)'  - [S]urround [R]eplace [)] [']
		require("mini.surround").setup()

		-- Simple and easy statusline.
		--  You could remove this setup call if you don't like it,
		--  and try some other statusline plugin
		local statusline = require("mini.statusline")
		-- set use_icons to true if you have a Nerd Font
		statusline.setup({ use_icons = vim.g.have_nerd_font })

		-- Mode highlight overrides: colored background instead of colored text
		vim.api.nvim_set_hl(0, "MiniStatuslineModeInsert", { bg = "#FF8080", fg = "#101010", bold = true })
		vim.api.nvim_set_hl(0, "MiniStatuslineModeVisual", { bg = "#FFCFA8", fg = "#101010", bold = true })
		vim.api.nvim_set_hl(0, "MiniStatuslineModeNormal", { bg = "#ffffff", fg = "#101010", bold = true })
		vim.api.nvim_set_hl(0, "MiniStatuslineModeReplace", { bg = "#FF8080", fg = "#101010", bold = true })
		vim.api.nvim_set_hl(0, "MiniStatuslineModeCommand", { bg = "#888888", fg = "#101010", bold = true })
		vim.api.nvim_set_hl(0, "MiniStatuslineModeOther", { bg = "#ffffff", fg = "#101010", bold = true })

		-- Black bar background, white filename (full path)
		vim.api.nvim_set_hl(0, "MiniStatuslineFilename", { bg = "#101010", fg = "#ffffff" })
		vim.api.nvim_set_hl(0, "MiniStatuslineDevinfo", { bg = "#101010", fg = "#888888" })
		vim.api.nvim_set_hl(0, "MiniStatuslineFileinfo", { bg = "#101010", fg = "#888888" })
		vim.api.nvim_set_hl(0, "MiniStatuslineInactive", { bg = "#101010", fg = "#555555" })

		-- You can configure sections in the statusline by overriding their
		-- default behavior. For example, here we set the section for
		-- cursor location to LINE:COLUMN
		---@diagnostic disable-next-line: duplicate-set-field
		statusline.section_location = function()
			return "%2l:%-2v"
		end

		---@diagnostic disable-next-line: duplicate-set-field
		statusline.section_filename = function()
			local path = vim.fn.expand("%:~:.") -- relative to ~ or cwd
			if path == "" then
				return "[No Name]"
			end
			if vim.bo.modified then
				path = path .. " [+]"
			end
			return path
		end

		-- ... and there is more!
		--  Check out: https://github.com/nvim-mini/mini.nvim
	end,
}
