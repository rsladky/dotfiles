return {
	{
		"jiaoshijie/undotree",
		opts = {
			window = {
				width = 0.15,
			},
		},
		keys = { -- load the plugin only when using it's keybinding:
			{ "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
			{ "<D-u>", "<cmd>lua require('undotree').toggle()<cr>" },
		},
	},
}
