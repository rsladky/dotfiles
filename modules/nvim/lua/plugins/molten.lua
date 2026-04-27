return {
	{
		"3rd/image.nvim",
		lazy = true,
		opts = {
			backend = "kitty",
			kitty_method = "normal",
			integrations = {},
			max_width = 100,
			max_height = 20,
			max_height_window_percentage = 40,
			max_width_window_percentage = 60,
			window_overlap_clear_enabled = true,
			window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
		},
	},
	{
		"benlubas/molten-nvim",
		version = "^1.0.0",
		build = ":UpdateRemotePlugins",
		dependencies = { "3rd/image.nvim" },
		init = function()
			vim.g.molten_image_provider = "image.nvim"
			vim.g.molten_output_win_max_height = 20
			vim.g.molten_auto_open_output = true
			vim.g.molten_wrap_output = true
			vim.g.molten_virt_text_output = true
			vim.g.molten_virt_lines_off_by_1 = true
		end,
		keys = {
			{ "<leader>mi", ":MoltenInit<CR>",                          desc = "Molten: init kernel",         silent = true },
			{ "<leader>me", ":MoltenEvaluateOperator<CR>",              desc = "Molten: run operator",        silent = true },
			{ "<leader>ml", ":MoltenEvaluateLine<CR>",                  desc = "Molten: run line",            silent = true },
			{ "<leader>mv", ":<C-u>MoltenEvaluateVisual<CR>gv",         desc = "Molten: run visual",          silent = true, mode = "v" },
			{ "<leader>mr", ":MoltenReevaluateCell<CR>",                desc = "Molten: re-run cell",         silent = true },
			{ "<leader>md", ":MoltenDelete<CR>",                        desc = "Molten: delete cell",         silent = true },
			{ "<leader>mh", ":MoltenHideOutput<CR>",                    desc = "Molten: hide output",         silent = true },
			{ "<leader>ms", ":noautocmd MoltenEnterOutput<CR>",         desc = "Molten: enter output",        silent = true },
			{ "<leader>mo", ":MoltenOpenInBrowser<CR>",                 desc = "Molten: open in browser",     silent = true },
		},
	},
}
