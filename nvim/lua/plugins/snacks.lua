return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		-- Performance: render files before plugins load
		quickfile = { enabled = true },

		-- Performance: disable heavy features on large files
		bigfile = { enabled = true },

		-- Dashboard (replaces alpha-nvim)
		dashboard = {
			enabled = true,
			sections = {
				{
					section = "header",
					padding = 1,
				},
				{ section = "keys", gap = 1 },
				{ section = "recent_files", padding = 1 },
				{ section = "startup" },
			},
			preset = {
				header = [[

███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
]],
			},
		},

		-- Indent guides (replaces indent-blankline.nvim)
		indent = {
			enabled = true,
			indent = {
				char = "▏",
			},
			scope = {
				enabled = true,
				char = "▏",
				underline = false,
			},
			filter = function(buf)
				if vim.bo[buf].buftype == "terminal" then
					return false
				end
				if vim.bo[buf].buftype == "nofile" then
					return false
				end
				local ft = vim.bo[buf].filetype
				local excluded =
					{ help = true, dashboard = true, packer = true, NvimTree = true, Trouble = true, mason = true }
				return not excluded[ft]
			end,
		},

		-- Scope detection (used by indent module)
		scope = { enabled = true },

		-- Notifications (replaces fidget.nvim)
		notifier = {
			enabled = true,
			style = "minimal",
		},

		-- Fuzzy finder (replaces telescope.nvim)
		picker = {
			enabled = true,
			sources = {
				explorer = {
					layout = {
						layout = { width = 25, min_width = 25 },
					},
				},
				files = {
					hidden = true,
					ignored = false,
					exclude = { "node_modules", ".git", ".venv" },
				},
				grep = {
					hidden = true,
					exclude = { "node_modules", ".git", ".venv" },
				},
			},
			win = {
				input = {
					keys = {
						-- ["È"] = { "list_up", mode = { "i", "n" } },
						-- ["Ï"] = { "list_down", mode = { "i", "n" } },
						["K"] = { "list_up", mode = { "i", "n" } },
						["J"] = { "list_down", mode = { "i", "n" } },
						-- ["<C-k>"] = { "list_up", mode = { "i", "n" } },
						-- ["<C-j>"] = { "list_down", mode = { "i", "n" } },
						-- ["<D-k>"] = { "list_up", mode = { "i", "n" } },
						-- ["<D-j>"] = { "list_down", mode = { "i", "n" } },

						["<leader>p"] = { "close", mode = { "i", "n" } },
					},
				},
			},
		},

		-- File explorer (replaces neo-tree.nvim)
		explorer = {
			enabled = true,
		},

		-- Image viewer (replaces 3rd/image.nvim)
		image = { enabled = true },

		-- Git browse (replaces vim-rhubarb)
		gitbrowse = { enabled = true },

		-- LazyGit integration
		lazygit = {
			enabled = true,
			win = {
				keys = {
					["<leader>g"] = { "close", mode = { "i", "n", "t" } },
				},
			},
		},

		-- Floating terminal
		terminal = { enabled = true },

		-- Jump between LSP references
		words = { enabled = true },

		-- Better vim.ui.input
		input = { enabled = true },

		-- Buffer deletion without layout disruption
		bufdelete = { enabled = true },

		-- Enhanced status column
		statuscolumn = { enabled = true },

		-- Toggle keymaps
		toggle = { enabled = true },
	},

	keys = {
		-- Picker (telescope replacements)
		{
			"<leader>p",
			function()
				Snacks.picker.files()
			end,
			desc = "[S]earch [F]iles",
		},
		{
			"<leader>sg",
			function()
				Snacks.picker.grep()
			end,
			desc = "[S]earch by [G]rep",
		},
		{
			"<leader>sh",
			function()
				Snacks.picker.help()
			end,
			desc = "[S]earch [H]elp",
		},
		{
			"<leader>sk",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "[S]earch [K]eymaps",
		},
		{
			"<leader>ss",
			function()
				Snacks.picker.pickers()
			end,
			desc = "[S]earch [S]elect Picker",
		},
		{
			"<leader>sw",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "[S]earch current [W]ord",
		},
		{
			"<leader>sd",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "[S]earch [D]iagnostics",
		},
		{
			"<leader>sr",
			function()
				Snacks.picker.resume()
			end,
			desc = "[S]earch [R]esume",
		},
		{
			"<leader>s.",
			function()
				Snacks.picker.recent()
			end,
			desc = '[S]earch Recent Files ("." for repeat)',
		},
		{
			"<leader><leader>",
			function()
				Snacks.picker.buffers()
			end,
			desc = "[ ] Find existing buffers",
		},
		{
			"<leader>/",
			function()
				Snacks.picker.lines()
			end,
			desc = "[/] Fuzzily search in current buffer",
		},
		{
			"<leader>s/",
			function()
				Snacks.picker.grep_buffers()
			end,
			desc = "[S]earch [/] in Open Files",
		},

		-- LSP pickers (set here so they're available before LspAttach via snacks)
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "LSP: [G]oto [D]efinition",
		},
		{
			"gr",
			function()
				Snacks.picker.lsp_references()
			end,
			desc = "LSP: [G]oto [R]eferences",
			nowait = true,
		},
		{
			"gI",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "LSP: [G]oto [I]mplementation",
		},
		{
			"<leader>D",
			function()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "LSP: Type [D]efinition",
		},
		{
			"<leader>ds",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "LSP: [D]ocument [S]ymbols",
		},
		{
			"<leader>ws",
			function()
				Snacks.picker.lsp_workspace_symbols()
			end,
			desc = "LSP: [W]orkspace [S]ymbols",
		},

		-- Explorer (neo-tree replacements)
		{
			"<leader>b",
			function()
				Snacks.explorer.open()
			end,
			desc = "Toggle Explorer",
		},
		{
			"\\",
			function()
				Snacks.explorer.reveal()
			end,
			desc = "Reveal in Explorer",
		},
		{
			"<leader>ngs",
			function()
				Snacks.picker.git_status()
			end,
			desc = "[N]eo-tree [G]it [S]tatus",
		},

		-- New features
		{
			"<leader>lg",
			function()
				Snacks.lazygit.open()
			end,
			desc = "[L]azy[G]it",
		},
		{
			"<leader>g",
			function()
				Snacks.lazygit.open()
			end,
			desc = "[L]azy[G]it",
		},
		{
			"<leader>ft",
			function()
				Snacks.terminal.toggle()
			end,
			desc = "[F]loating [T]erminal",
		},
		{
			"<leader>gb",
			function()
				Snacks.gitbrowse.open()
			end,
			desc = "[G]it [B]rowse (GitHub)",
		},
		{
			"<leader>bd",
			function()
				Snacks.bufdelete.delete()
			end,
			desc = "[B]uffer [D]elete",
		},
		{
			"]]",
			function()
				Snacks.words.jump(1)
			end,
			desc = "Next LSP Reference",
		},
		{
			"[[",
			function()
				Snacks.words.jump(-1)
			end,
			desc = "Prev LSP Reference",
		},
		{
			"<leader>un",
			function()
				Snacks.notifier.hide()
			end,
			desc = "Dismiss Notifications",
		},
		{
			"<leader>nh",
			function()
				Snacks.notifier.show_history()
			end,
			desc = "[N]otification [H]istory",
		},
	},

	init = function()
		-- Match picker/explorer float background to the normal editor background
		vim.api.nvim_create_autocmd("ColorScheme", {
			callback = function()
				local bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
				if bg then
					local hex = string.format("#%06x", bg)
					vim.api.nvim_set_hl(0, "SnacksPickerList", { bg = hex })
					vim.api.nvim_set_hl(0, "SnacksPickerInput", { bg = hex })
					vim.api.nvim_set_hl(0, "SnacksPickerPreview", { bg = hex })
					vim.api.nvim_set_hl(0, "SnacksExplorerNormal", { bg = hex })
					vim.api.nvim_set_hl(0, "SnacksPickerBorder", { bg = hex })
					vim.api.nvim_set_hl(0, "SnacksExplorerWinBar", { bg = hex })
					vim.api.nvim_set_hl(0, "NormalFloat", { bg = hex })
					vim.api.nvim_set_hl(0, "FloatBorder", { bg = hex })
				end
			end,
		})

		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				-- Apply bg overrides once after all plugins (including colorscheme) have loaded
				vim.api.nvim_exec_autocmds("ColorScheme", {})

				-- Toggle keymaps (integrates with which-key)
				Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
				Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
				Snacks.toggle.diagnostics():map("<leader>ud")
				Snacks.toggle.inlay_hints():map("<leader>uh")
			end,
		})
	end,
}
