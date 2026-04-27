require("core.keymaps._common")
local layout = vim.env.KB_LAYOUT or "qwerty"
local ok, err = pcall(require, "core.keymaps._layout_" .. layout)
if not ok then
  vim.notify("KB_LAYOUT='" .. layout .. "' load failed: " .. err, vim.log.levels.WARN)
end
