return {
	"datsfilipe/vesper.nvim",
	priority = 1000, -- Make sure to load this before all the other start plugins.
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("vesper").setup({
			transparent = false, -- Boolean: Sets the background to transparent
			italics = {
				comments = false, -- Boolean: Italicizes comments
				keywords = false, -- Boolean: Italicizes keywords
				functions = false, -- Boolean: Italicizes functions
				strings = false, -- Boolean: Italicizes strings
				variables = false, -- Boolean: Italicizes variables
			},
			overrides = {}, -- A dictionary of group names, can be a function returning a dictionary or a table.
			palette_overrides = {},
		})
		-- Load the colorscheme here.
		-- Like many other themes, this one has different styles, and you could load
		-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
		vim.cmd.colorscheme("vesper")
	end,
}
