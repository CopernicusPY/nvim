require("htw.plugins.lualine")
require("htw.plugins.nvim-tree")
require("htw.plugins.todo-comments")
require("htw.plugins.treesitter")
require("htw.plugins.lsp")

-- This file can be loaded by calling `lua require("plugins")` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

local fn = vim.fn
-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don"t error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})
return require("packer").startup(function(use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"
  
  -- Telescope
  use {
    "nvim-telescope/telescope.nvim", tag = "0.1.0",
    requires = { {"nvim-lua/plenary.nvim"} }
  }
  
  -- Colorscheme (Catppuccin frappe)
  use { "catppuccin/nvim", as = "catppuccin" } 
  
  -- Icons
  use 'nvim-tree/nvim-web-devicons'
  -- Lightweight and customizable status line
  use {
  "nvim-lualine/lualine.nvim",
  }

-- File explorer
  use { 
    "nvim-tree/nvim-tree.lua",
  }


-- Mini games to get better :P
  use {
    "ThePrimeagen/vim-be-good"
  }

  use {
    "lukas-reineke/indent-blankline.nvim"
  }
  
  -- ToDo highlighter
  use {
  "folke/todo-comments.nvim",
  requires = "nvim-lua/plenary.nvim",
  }
  use('nvim-treesitter/nvim-treesitter', {run = ":TSUpdate"})
  use {
  'VonHeikemen/lsp-zero.nvim',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'saadparwaiz1/cmp_luasnip'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-nvim-lua'},

    -- Snippets
    {'L3MON4D3/LuaSnip'},
    -- Snippet Collection (Optional)
    {'rafamadriz/friendly-snippets'},
  }
}

-- Automatically sync plugins
  if PACKER_BOOTSTRAP then
		require("packer").sync()
		print("Plugins are being installed.\nWait until Packer completes,\n then restart nvim")	
  end
end)
