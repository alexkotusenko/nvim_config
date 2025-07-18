--- print("[CONFIG] Loading init.lua...") -- DEBUG

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic settings
vim.o.number = true -- Show line numbers
vim.o.relativenumber = false -- Show relative line numbers
vim.o.expandtab = false -- Use spaces instead of tabs
vim.o.shiftwidth = 2 -- Size of an indent
vim.o.tabstop = 2 -- Number of spaces tabs count for
vim.o.softtabstop = 2 -- Number of spaces in tab when editin

-- Initialize LazyVim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
                "git",
                "clone",
                "--filter=blob:none",
                "https://github.com/folke/lazy.nvim.git",
                "--branch=stable", -- latest stable release
                lazypath
        })
end
vim.opt.rtp:prepend(lazypath)
vim.opt.autochdir = true 

-- harpoon save fn
-- local function load_harpoon_list()
--     local file = io.open(harpoon_file, "r")
--     if file then
--         for line in file:lines() do
--             harpoon:list():append(line)
--         end
--         file:close()
--         print("Harpoon list loaded successfully.")
--     else
--         print("Error: Could not open file for reading.")
--     end
-- end


-- Declare a global function to retrieve the current directory
-- this is used to show the cwd in a bar in :Oil above the files
function _G.get_oil_winbar()
  local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
  local dir = require("oil").get_current_dir(bufnr)
  if dir then
    return vim.fn.fnamemodify(dir, ":~")
  else
    -- If there is no current directory (e.g. over ssh), just show the buffer name
    return vim.api.nvim_buf_get_name(0)
  end
end

-- Define and load plugins
-- local harpoon_spec = dofile(vim.fn.stdpath("config") .. "/harpoon.lua")
local complete_spec = dofile(vim.fn.stdpath("config") .. "/complete.lua")
local treesitter_spec = dofile(vim.fn.stdpath("config") .. "/treesitter.lua")
local which_key_spec = dofile(vim.fn.stdpath("config") .. "/which_key.lua")
local telescope_tabs_spec = dofile(vim.fn.stdpath("config") .. "/telescope_tabs.lua")
local telescope_spec = dofile(vim.fn.stdpath("config") .. "/telescope.lua")





require("lazy").setup({
  spec = {
    -- harpoon_spec,
		complete_spec,
		treesitter_spec,
		which_key_spec,
		telescope_tabs_spec,
		telescope_spec,
		{ 'neovim/nvim-lspconfig' },
		{ "williamboman/mason.nvim" },
		{ 'sainnhe/gruvbox-material' }, -- gruvbox-material
		{ 'bartekjaszczak/finale-nvim' }, -- finale-nvim
		{ 'rebelot/kanagawa.nvim' },
		{ 'rose-pine/neovim' },
		{ 'marko-cerovac/material.nvim' },
		{ 'tiagovla/tokyodark.nvim' },
		{ 'sponkurtus2/angelic.nvim' },
		{ 'bluz71/vim-moonfly-colors' }, -- amazing charcoal theme
		{ 'ficcdaf/ashen.nvim' },
		{ 'projekt0n/github-nvim-theme' },
		{ 'tomasr/molokai' },
		{ 'nvimdev/zephyr-nvim' },
		{ 'navarasu/onedark.nvim' },
		{ 'rafamadriz/neon' }, -- actually pretty pastel
		{ 'nyoom-engineering/oxocarbon.nvim' },
		{ 'shaeinst/roshnivim-cs' },
		{ 'stevedylandev/darkmatter-nvim' },
    { -- SONOKAI THEME
      'sainnhe/sonokai',
      lazy = false,
      priority = 1000,
      config = function()
        -- Optionally configure and load the colorscheme
        -- directly inside the plugin declaration.
        vim.g.sonokai_enable_italic = true
        -- vim.cmd.colorscheme('kanagawa-wave')
    end
		},
		{ 'dylanaraps/wal.vim' }, -- for creating your own theme
-- use the lua one instead
-- { "github/copilot.vim" },
-- { "giuxtaposition/blink-cmp-copilot" },

-- {
--   "zbirenbaum/copilot.lua",
--   cmd = "Copilot",
--   event = "InsertEnter",
--   config = function()
--     require("copilot").setup({})
--   end,
--   -- suggestion = {
--   --   keymap = {
--   --       accept = "<C-k>"
--   --   }
--   -- }
-- },
		{
			"nomnivore/ollama.nvim",
			dependencies = { "nvim-lua/plenary.nvim" },
			cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },
		},

		{ -- oil.nvim
			'stevearc/oil.nvim',
			---@module 'oil'
			---@type oil.SetupOpts
			opts = {},
			-- Optional dependencies
			dependencies = { { "echasnovski/mini.icons", opts = {} } },
			-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
			-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
			lazy = false,
		}




  },
}, {})

-- configure rose pine
require("rose-pine").setup({
    variant = "auto", -- auto, main, moon, or dawn
    dark_variant = "main", -- main, moon, or dawn
    dim_inactive_windows = false,
    extend_background_behind_borders = true,

    enable = {
        terminal = true,
        legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
        migrations = true, -- Handle deprecated options automatically
    },

    styles = {
        bold = true,
        italic = true,
        transparency = false,
    },

    groups = {
        border = "muted",
        link = "iris",
        panel = "surface",

        error = "love",
        hint = "iris",
        info = "foam",
        note = "pine",
        todo = "rose",
        warn = "gold",

        git_add = "foam",
        git_change = "rose",
        git_delete = "love",
        git_dirty = "rose",
        git_ignore = "muted",
        git_merge = "iris",
        git_rename = "pine",
        git_stage = "iris",
        git_text = "rose",
        git_untracked = "subtle",

        h1 = "iris",
        h2 = "foam",
        h3 = "rose",
        h4 = "gold",
        h5 = "pine",
        h6 = "foam",
    },

    palette = {
        -- Override the builtin palette per variant
        -- moon = {
        --     base = '#18191a',
        --     overlay = '#363738',
        -- },
    },

	-- NOTE: Highlight groups are extended (merged) by default. Disable this
	-- per group via `inherit = false`
    highlight_groups = {
        -- Comment = { fg = "foam" },
        -- StatusLine = { fg = "love", bg = "love", blend = 15 },
        -- VertSplit = { fg = "muted", bg = "muted" },
        -- Visual = { fg = "base", bg = "text", inherit = false },
    },

    before_highlight = function(group, highlight, palette)
        -- Disable all undercurls
        -- if highlight.undercurl then
        --     highlight.undercurl = false
        -- end
        --
        -- Change palette colour
        -- if highlight.fg == palette.pine then
        --     highlight.fg = palette.foam
        -- end
    end,
})




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


-- configure ollama
require("ollama").setup({
  model = "qwen2.5:latest", -- Choose your preferred model
  url = "http://127.0.0.1:11434", -- Ensure Ollama is running locally
  serve = {
    -- on_start = true,
		on_start = false, -- maybe I should not serve it on start
    command = "ollama",
    args = { "serve" },
  },
})

-- override LSP handler to avoid diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end

-- set colorscheme
-- alternatives: molokai, sonokai
vim.cmd.colorscheme("moonfly")

-- proper wrapping
vim.opt.wrap = true
vim.opt.breakindent = true
-- vim.opt.showbreak = "␣␣␣" -- Adds a visual indicator for wrapped lines
vim.opt.linebreak = true -- Prevents breaking words in the middle

-- telescope
require('telescope').setup {
  defaults = {
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    -- Optional layout tweaks
    layout_config = {
      preview_cutoff = 0,  -- Always show preview
      -- width = 0.99,
      -- height = 0.99,
    },
  },
	pickers = {
		colorscheme = {
			enable_preview = true
		}
	}
}

require("oil").setup({
  -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
  -- Set to false if you want some other plugin (e.g. netrw) to open when you edit directories.
	default_file_explorer = true, -- prevent oil from hijacking :e

  win_options = {
    winbar = "%!v:lua.get_oil_winbar()",
  },
})
