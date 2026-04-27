return {
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		ft = "markdown",
		event = {
			"BufReadPre " .. vim.fn.expand("~") .. "/Obsidian/**.md",
			"BufNewFile " .. vim.fn.expand("~") .. "/Obsidian/**.md",
		},
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			workspaces = {
				{ name = "personal", path = "~/Obsidian" },
			},

			-- Daily notes
			daily_notes = {
				folder = "Daily",
				date_format = "%Y-%m-%d",
			},

			templates = {
				folder = "_Templates",
			},

			-- Completion for [[wiki links]] via nvim-cmp
			completion = {
				nvim_cmp = true,
				min_chars = 2,
			},

			-- UI handled by render-markdown.nvim
			ui = { enable = false },

			-- Open in Obsidian app
			follow_url_func = function(url)
				vim.fn.jobstart({ "open", url })
			end,
		},
		keys = {
			{ "<leader>on", "<cmd>ObsidianNew<cr>",           desc = "[O]bsidian [N]ew note" },
			{ "<leader>oo", "<cmd>ObsidianOpen<cr>",          desc = "[O]bsidian [O]pen in app" },
			{ "<leader>of", "<cmd>ObsidianQuickSwitch<cr>",   desc = "[O]bsidian [F]ind note" },
			{ "<leader>os", "<cmd>ObsidianSearch<cr>",        desc = "[O]bsidian [S]earch" },
			{ "<leader>ob", "<cmd>ObsidianBacklinks<cr>",     desc = "[O]bsidian [B]acklinks" },
			{ "<leader>od", "<cmd>ObsidianDailies<cr>",       desc = "[O]bsidian [D]ailies" },
			{ "<leader>ot", "<cmd>ObsidianTemplate<cr>",      desc = "[O]bsidian [T]emplate" },
			{ "<leader>ol", "<cmd>ObsidianLinks<cr>",         desc = "[O]bsidian [L]inks" },
			{ "<leader>or", "<cmd>ObsidianRename<cr>",        desc = "[O]bsidian [R]ename note" },
			{ "<leader>op", "<cmd>ObsidianPasteImg<cr>",      desc = "[O]bsidian [P]aste image" },
			{ "<leader>oe", "<cmd>ObsidianExtractNote<cr>",   desc = "[O]bsidian [E]xtract to note", mode = "v" },
			{ "<leader>o>", "<cmd>ObsidianFollowLink<cr>",    desc = "[O]bsidian follow link" },
		},
	},
}
