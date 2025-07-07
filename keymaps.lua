
local harpoon = require("harpoon")
local remap = vim.keymap.set

-- open file explorer
-- local file_explorer_fn = ":Lexplore<CR>"
-- local file_explorer_fn = ":Telescope find_files<CR>"
vim.keymap.set("n", "<leader>e", function() 
	require("telescope.builtin").find_files()
end, { noremap = true })

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
-- left
remap("n", "<C-]>", ":wincmd l<CR>", {noremap=true})
-- right
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
end, { noremap = true, silent = true, desc = "Browse open buffers w/ Telescope"})


-- Open file in new tab 
remap("n", "sf", function() 
	-- vim.cmd("tabnew")
	require('telescope.builtin').find_files()
	-- todo open it in a new tab
end, { noremap = true, silent = true, desc = "Load file into this buffer w/ Telescope"})

-- See marks
remap("n", "sm", function()
	require("telescope.builtin").marks()
end, {noremap = true, silent = true, desc = "Browse marks w/ Telescope" })

-- generate code with ai
remap("n", "<leader>Ag", function()
	vim.cmd("Ollama Generate_Code")
end, { noremap = true, silent = true })

-- modify code with ai
remap("v", "m", function()
im.cmd("Ollama Modify_Code")
end, { noremap = true, silent = true })

-- telescope tabs (experimental)
remap("n", "st", function()
	require('telescope-tabs').list_tabs()
end, {noremap = true, silent = true, desc = "List open tabs in Telescope"})
