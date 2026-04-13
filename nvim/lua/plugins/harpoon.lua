return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({
			settings = {
				save_on_toggle = true,
			},
			default = {
				display = function(list_item)
					-- Show only the filename, not the full path
					return vim.fn.fnamemodify(list_item.value, ":t")
				end,
			},
			-- menu = {
			-- 	width = vim.api.nvim_win_get_width(0) / 4, -- Half editor width for centering
			-- 	height = vim.api.nvim_win_get_height(0) / 2, -- Half editor height for centering
			-- },
		})

		harpoon:extend({
			UI_CREATE = function(cx)
				local width = 45
				local height = 10
				local row = math.floor((vim.o.lines - height) / 2)
				local col = math.floor((vim.o.columns - width) / 2)
				vim.api.nvim_win_set_config(cx.win_id, {
					relative = "editor",
					width = width,
					height = height,
					row = row,
					col = col,
				})
			end,
		})

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", "<leader>e", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		vim.keymap.set("n", "<leader>&", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<leader>é", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", '<leader>"', function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<leader>'", function()
			harpoon:list():select(4)
		end)

		-- vim.keymap.set("n", "<Tab>", function()
		-- 	harpoon:list():next()
		-- end)
		-- vim.keymap.set("n", "<S-Tab>", function()
		-- 	harpoon:list():prev()
		-- end)
	end,
}
