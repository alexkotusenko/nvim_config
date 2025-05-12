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

-- switch tabs
remap("n", "\\[", ":tabprev<CR>", { noremap = true })
remap("n", "\\]", ":tabnext<CR>", { noremap = true })
remap("n", "\\\\", ":tabnew<CR>", { noremap = true })

-- `G` always goes back to the very last symbol
remap("n", "G", "G$")

-- vsplit 
remap("n", "<leader>v", function()
	vim.cmd("vsplit") -- vsplit
end, { noremap = true, silent = true })

-- no highlight
remap("n", "<leader>h", function()
	vim.cmd("nohlsearch")
end, { noremap = true, silent = true })

-- navigating tabs 
remap("n", "<C-]>", ":wincmd l<CR>", {noremap=true})
remap("n", "<C-[>", ":wincmd h<CR>", {noremap=true})


-- dump
remap("n", "<leader>d", function()
    vim.cmd("tabnew") -- Create a new buffer
    vim.cmd("e ~/system/THE_DUMP.txt") -- Load THE_DUMP.txt into the new buffer
    vim.cmd("normal! G") -- Jump to the end of the file
    vim.cmd("normal! o") -- Create a new line and enter insert mode
end, { noremap = true, silent = true })


-- search buffers
remap("n", "sb", function()
	require('telescope.builtin').buffers()
end, { noremap = true, silent = true })


-- Open file in new tab 
remap("n", "sf", function() 
	vim.cmd("tabnew")
	require('telescope.builtin').find_files()
	-- todo open it in a new tab
end, { noremap = true, silent = true })

