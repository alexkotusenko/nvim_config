-- keymaps.lua
local harpoon = require("harpoon")
local remap = vim.keymap.set

--harpoon:setup()
-- require("harpoon").setup()

-- overrides lazy menu
remap("n", "l", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
end)

remap("n", "<leader>a", function()
        harpoon:list():add()
        vim.notify("Pinned!", 1)
end)

-- overrides code actions
remap("n", "<leader>cc", function()
        harpoon:list():clear()
        vim.notify("All buffers unpinned!", 1)
end)

