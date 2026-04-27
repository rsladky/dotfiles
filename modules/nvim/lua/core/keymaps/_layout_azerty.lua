-- AZERTY-specific bindings — add layout-dependent keymaps here
local opts = { noremap = true, silent = true }

-- ù as % (jump to matching bracket)
vim.keymap.set({ "n", "v" }, "ù", "%", opts)
