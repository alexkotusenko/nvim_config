-- print("[CONFIG] Loading init.lua...") -- DEBUG

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic settings
vim.o.number = true -- Show line numbers
vim.o.relativenumber = false -- Show relative line numbers
vim.o.expandtab = false -- Use spaces instead of tabs
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

-- harpoon save fn
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


-- Define and load plugins
local harpoon_spec = dofile(vim.fn.stdpath("config") .. "/harpoon.lua")
local complete_spec = dofile(vim.fn.stdpath("config") .. "/complete.lua")
local treesitter_spec = dofile(vim.fn.stdpath("config") .. "/treesitter.lua")
local which_key_spec = dofile(vim.fn.stdpath("config") .. "/which_key.lua")


require("lazy").setup({
  spec = {
    harpoon_spec,
		complete_spec,
		treesitter_spec,
		which_key_spec,
		{ 'neovim/nvim-lspconfig' },
		{ "williamboman/mason.nvim" },
		{ 'sainnhe/gruvbox-material' }, -- gruvbox-material
		{ 'bartekjaszczak/finale-nvim' }, -- finale-nvim
		{ 'rebelot/kanagawa.nvim' },
    { -- SONOKAI THEME
      'sainnhe/sonokai',
      lazy = false,
      priority = 1000,
      config = function()
        -- Optionally configure and load the colorscheme
        -- directly inside the plugin declaration.
        vim.g.sonokai_enable_italic = true
        vim.cmd.colorscheme('kanagawa-wave')
      end
    },



  },
}, {})

require("mason").setup()

-- Import key mappings from keymaps.lua
-- you need to do this for the file to be found from any folder, not just ~/.config/nvim
local keymaps_path = vim.fn.stdpath("config") .. "/keymaps.lua"
dofile(keymaps_path)

-- configure LSPs
local lspconfig = require("lspconfig")
lspconfig.rust_analyzer.setup({
  settings = {
    ["rust-analyzer"] = {
      diagnostics = {
        enable = false, -- Disables error messages
      },
      imports = {
        granularity = { group = "module" },
        prefix = "self",
      },
    }
  }
})


-- override LSP handler to avoid diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end

