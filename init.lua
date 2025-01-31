-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic settings
vim.o.number = true -- Show line numbers
vim.o.relativenumber = false -- Show relative line numbers
vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.shiftwidth = 2 -- Size of an indent
vim.o.tabstop = 2 -- Number of spaces tabs count for
vim.o.softtabstop = 2 -- Number of spaces in tab when editing

-- Initialize LazyVim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
                "git",
                "clone",
                "--filter=blob:none",
                "https://github.com/folke/lazy.nvim.git",
                "--branch=stable", -- latest stable release
                lazypath,
        })
end
vim.opt.rtp:prepend(lazypath)

-- Define and load plugins
require("lazy").setup({
        spec = {
          -- Import the harpoon plugin configuration
          {
            "ThePrimeagen/harpoon",
            branch = "harpoon2",
            dependencies = { "nvim-lua/plenary.nvim" },
          },
        },
}, {})

-- Import key mappings from keymaps.lua
require("keymaps")

-- Key mappings
vim.keymap.set("n", "<leader>e", ":Lexplore<CR>", { noremap = true }) -- Open file explorer

