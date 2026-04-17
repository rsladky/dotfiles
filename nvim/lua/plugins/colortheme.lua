return {
	dir = vim.fn.stdpath("config"),
	name = "cendre",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("cendre")
	end,
}
