-- keymaps.lua
local harpoon = require("harpoon")
local remap = vim.keymap.set

-- open file explorer
vim.keymap.set("n", "<leader>e", ":Lexplore<CR>", { noremap = true })
vim.keymap.set("n", "sf", ":Lexplore<CR>", { noremap = true })

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

-- dump
remap("n", "<leader>d", function()
    vim.cmd("tabnew") -- Create a new buffer
    vim.cmd("e ~/system/THE_DUMP.txt") -- Load THE_DUMP.txt into the new buffer
    vim.cmd("normal! G") -- Jump to the end of the file
    vim.cmd("normal! o") -- Create a new line and enter insert mode
end, { noremap = true, silent = true })

