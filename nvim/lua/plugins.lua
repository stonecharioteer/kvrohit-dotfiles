local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
  execute("packadd packer.nvim")
end

local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
  return
end

packer.init({
  git = {
    clone_timeout = 120,
  },
})

local plugins = {
  -- packer
  { "wbthomason/packer.nvim" },
  -- color schemes
  {'rafamadriz/neon'},
  {'ThePrimeagen/vim-be-good'},
  {'kvrohit/substrata.nvim'},
  {'sainnhe/sonokai'},
  {'folke/tokyonight.nvim'},
  {"jacoborus/tender.vim"},
  { "catppuccin/nvim" },
  { "rebelot/kanagawa.nvim" },
  -- enhancements
  {
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
    },
    config = function()
      require("config.telescope").setup()
    end,
  },
  {
    'nvim-telescope/telescope-file-browser.nvim',
    config = function()
      require("telescope").load_extension "file_browser"
    end
  },
  -- lsp
  {
    "neovim/nvim-lspconfig",
  },
  {
    "williamboman/nvim-lsp-installer",
    config = function()
      require("config.lsp").setup()
    end,
  },
  {'vim-airline/vim-airline'},
  {'christoomey/vim-tmux-navigator'},
  { "ray-x/lsp_signature.nvim" },
  -- completion
  {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      require("config.cmp").setup()
    end,
  },
  {
    "abecodes/tabout.nvim",
    config = function()
      require("config.tabout").setup()
    end,
    after = { "nvim-cmp" }, -- if a completion plugin is using tabs load it before
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("config.treesitter").setup()
    end,
  },
  {
    'akinsho/nvim-toggleterm.lua',
    config = function()
      require("config.toggleterm").setup()
    end,
  },
  {
    'jose-elias-alvarez/buftabline.nvim',
    config = function()
      require("config.buftabline").setup()
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup()
    end,
  },
  {
    "kyazdani42/nvim-tree.lua",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require('nvim-tree').setup {
        auto_close = true
      }
    end
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "famiu/feline.nvim",
    config = function()
      require("config.statusline").setup()
    end,
  },
  -- essentials
  {'tpope/vim-repeat'},
  {'tpope/vim-surround'},
  {'tpope/vim-fugitive'},
  {'tpope/vim-sleuth'},
  {'b3nj5m1n/kommentary'},
  {'f-person/git-blame.nvim'},
  {'kvrohit/tasks.nvim'},
  {
    'windwp/nvim-autopairs',
    after = 'nvim-cmp',
    config = function()
      require("config.autopairs").setup()
    end,
  },
  {
    "windwp/nvim-ts-autotag",
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("config.null-ls").setup()
    end,
    requires = { "nvim-lua/plenary.nvim" },
  },
  { "lukas-reineke/indent-blankline.nvim" },
  {
    'folke/todo-comments.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'}
    },
    config = function()
      require('todo-comments').setup()
    end
  },
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
  {"mracos/mermaid.vim"},
  {'fladson/vim-kitty'},
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
  { "b0o/schemastore.nvim" },
  { "Olical/conjure" },
  {"rafamadriz/friendly-snippets"},
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup()
    end,
  },
  -- Merklescience config
  {'jmeekhof/gsql-vim'},
}

vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])
return packer.startup(function(use)
  for _, v in pairs(plugins) do
    use(v)
  end
end)
