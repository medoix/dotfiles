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

    -- Telescope --
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
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'nvim-treesitter/playground'
 
    -- Themes --
    use 'folke/tokyonight.nvim'

    -- Utilities --
    use 'tweekmonster/startuptime.vim'
    use 'phaazon/hop.nvim'
    use 'tiagovla/ezmap.nvim'
    use {'akinsho/nvim-bufferline.lua', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
    use {'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
    use {'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
    use 'voldikss/vim-floaterm'
    use 'takac/vim-hardtime' -- see http://vimcasts.org/blog/2013/02/habit-breaking-habit-making/

end)
