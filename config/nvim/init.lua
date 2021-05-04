--
-- VIM Leader Key
--
vim.g.mapleader = " "

--
-- Initalize
--
require('plugins')
require('autogroups').setup()
require('themes').setup()
require('settings').setup()
require('mappings').setup()
require('plug-config')
