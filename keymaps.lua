
local remap = vim.keymap.set

-- remap("n", "<leader>a", function()
--         harpoon:list():add()
--         vim.notify("Pinned!", 1)
-- end)

-- overrides code actions
-- remap("n", "<leader>cc", function()
--         harpoon:list():clear()
--         vim.notify("All buffers unpinned!", 1)
-- end)

-- switch tabs
remap("n", "\\[", ":tabprev<CR>", { noremap = true })
remap("n", "\\]", ":tabnext<CR>", { noremap = true })
remap("n", "\\\\", ":tabnew<CR>", { noremap = true })

-- focus tabs / nagivating tabs
remap("n", "\\w", ":wincmd k<CR>", {noremap=true})
remap("n", "\\s", ":wincmd j<CR>", {noremap=true})
remap("n", "\\a", ":wincmd h<CR>", {noremap=true})
remap("n", "\\d", ":wincmd l<CR>", {noremap=true})

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
-- remap("n", "<C-]>", ":wincmd l<CR>", {noremap=true})
-- right
-- remap("n", "<C-[>", ":wincmd h<CR>", {noremap=true})




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

-- I DO NOT USE THE REGULAR hjkl KEYS!!
-- I USE ARROWS!
remap("n", "j", "'")
remap("n", "h", "")
remap("n", "k", "")
remap("n", "l", "")


-- use oil for file management
-- usually, if you're say in /tmp, and you want to edit a file in ~/.config, and if you have an alias that opens that file in ~/.config, when you run :e, you get shown the files in /tmp, which is inconventient. 
-- using :Oil uses the file the currently edited file is in
vim.keymap.set("n", "<leader>e", function()
  require("oil").toggle_float()
end, { desc = "Toggle Oil floating window" })

vim.keymap.set("n", "<leader>t", ":Twilight<CR>")


-- marks
-- vim.keymap.del("n", "M")
-- vim.keymap.set("n", "m", "lua require('markit').toggle_mark()")

-- overlook
vim.keymap.set("n", "<leader>od", require("overlook.api").peek_definition, { desc = "Peek definition" })
vim.keymap.set("n", "<leader>op", require("overlook.api").peek_cursor, { desc = "Peek cursor" })
vim.keymap.set("n", "<leader>ou", require("overlook.api").restore_popup, { desc = "Undo (restore) last popup" })
vim.keymap.set("n", "<leader>oU", require("overlook.api").restore_all_popups, { desc = "Undo (restore) all popups" })
vim.keymap.set("n", "<leader>oc", require("overlook.api").close_all, { desc = "Close all popups" })
vim.keymap.set("n", "<leader>os", require("overlook.api").open_in_split, { desc = "Open popup in split" })
vim.keymap.set("n", "<leader>ov", require("overlook.api").open_in_vsplit, { desc = "Open popup in vsplit" })
vim.keymap.set("n", "<leader>ot", require("overlook.api").open_in_tab, { desc = "Open popup in tab" })
vim.keymap.set("n", "<leader>oo", require("overlook.api").open_in_original_window, { desc = "Open popup in current window" })


