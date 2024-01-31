local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup({settings = {
	save_on_toggle = true
}})
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-ú>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-ä>", function() harpoon:list():next() end)
