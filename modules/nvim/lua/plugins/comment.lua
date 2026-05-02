-- Easily comment visual regions/lines
return {
	"numToStr/Comment.nvim",
	opts = {},
	keys = {
		{
			"<C-c>",
			function() require("Comment.api").toggle.linewise.current() end,
			mode = "n",
			desc = "Toggle line comment",
		},
		{
			"<C-c>",
			"<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
			mode = "v",
			desc = "Toggle line comment (visual)",
		},
	},
}
