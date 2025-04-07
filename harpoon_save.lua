

local harpoon = require("harpoon")
local harpoon_file = vim.fn.expand("~/.config/nvim/harpoon_list.txt")


local function save_harpoon_list()
		vim.notify("Saving to harpoon buffer!", 1)
    local list = harpoon:list()
    local file = io.open(harpoon_file, "w")
    for _, item in ipairs(list.items) do
        file:write(item.value .. "\n")
    end
    file:close()
end

local function load_harpoon_list()
    local file = io.open(harpoon_file, "r")
    if file then
        for line in file:lines() do
            harpoon:list():append(line)
        end
        file:close()
        print("Harpoon list loaded successfully.")
    else
        print("Error: Could not open file for reading.")
    end
end

vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = save_harpoon_list,
})

vim.api.nvim_create_autocmd("VimEnter", {
    callback = load_harpoon_list,
})

harpoon:setup()
