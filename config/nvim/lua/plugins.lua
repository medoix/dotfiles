--
-- Packer Installer
--
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

--
-- Packer Setup
--
return require('packer').startup(function()
    -- Packer --
    use {'wbthomason/packer.nvim', opt = true}

    -- Telescope File Explorer --
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use 'nvim-telescope/telescope-media-files.nvim'

    -- Formatting --
    use '9mm/vim-closer'
    use 'norcalli/nvim-colorizer.lua'
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'

    -- Language Support --
    use 'neovim/nvim-lspconfig'
    use {'hrsh7th/nvim-compe', requires = { 'neovim/nvim-lspconfig' }}
    use {'hrsh7th/vim-vsnip', requires = { 'hrsh7th/nvim-compe' }}
    -- TabNine currently broken on install with Packer
    --use {'tzachar/compe-tabnine', requires = 'hrsh7th/nvim-compe', run='./install.sh'}
    use {'nvim-treesitter/nvim-treesitter', requires = { 'neovim/nvim-lspconfig' }, run = ":TSUpdate"}
    use 'nvim-treesitter/playground'
 
    -- Themes --
    --
    -- Tokynight Theme (night/dark)
    use 'folke/tokyonight.nvim'


    -- Git Support --
    --
    --Shows histroy of commits
    use 'rhysd/git-messenger.vim'
    -- Signs for added, removed, and changed lines as well as Git blame info
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}

    -- Utilities --
    --
    -- Markdown Previewer
    use {'medoix/glow.nvim', run = ':GlowInstall'}
    -- Startup Performance Tester
    use 'tweekmonster/startuptime.vim'
    -- Hop to Words
    use 'phaazon/hop.nvim'
    -- Keyboard Mappings
    use 'tiagovla/ezmap.nvim'
    -- Top bar with tabs in VIM
    use {'akinsho/nvim-bufferline.lua', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
    -- Nicer bottom bar in VIM
    use {'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
    -- Floating Windows
    use 'voldikss/vim-floaterm'
    -- Enforces VIM behaviours
    use 'takac/vim-hardtime' -- see http://vimcasts.org/blog/2013/02/habit-breaking-habit-making/
    -- Weather Report for IP or <city param>
    use 'medoix/weather.nvim'
end)
