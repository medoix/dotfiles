local M = {}

local b = vim.bo
local g = vim.g
local o = vim.o
local w = vim.wo
local cmd = vim.cmd

function M.setup()
    M.options()
    M.window_options()
    M.commands()
end

function M.options()
    o.backup = false
    o.clipboard = 'unnamedplus'
    o.cmdheight = 1
    o.errorbells = false
    o.history = 1000
    o.hidden = true
    o.hlsearch = true
    o.inccommand = 'split'
    o.incsearch = true
    o.infercase = true
    o.joinspaces = false

    o.scrolloff = 10
    o.sidescrolloff = 8

    o.showbreak = '↳'
    o.showmode = false
    o.smarttab = true
    o.smartcase = true

    o.splitright = true
    o.splitbelow = true

    o.termguicolors = true
    o.wildmode = 'list:longest'

    b.shiftwidth = 4
    b.tabstop = 4
    b.softtabstop = 0
    b.expandtab = true
    b.smartindent = true
    b.shiftwidth = 4

    o.shiftwidth = 4
    o.tabstop = 4
    o.softtabstop = 0
    o.expandtab = true
    o.smartindent = true
    o.shiftwidth = 4

    g.showtabline = 2
end

function M.window_options()
    w.list = true
    w.number = true
    w.relativenumber = true
    w.wrap = false
    w.colorcolumn = '80'
end

function M.commands()
    cmd("set shortmess+=c")
    cmd("set mouse=a")
    cmd("set listchars=tab:!·,trail:·")
    cmd("set nowritebackup")
    cmd("set updatetime=300")
    cmd("set cursorline")
    cmd(
        [[ autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=300} ]])
    -- debugging function
    -- cmd([[
    --     function! SynGroup()
    --         let l:s = synID(line('.'), col('.'), 1)
    --         echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
    --     endfun
    -- ]])
    -- cmd([[nmap <F10> :call SynGroup() <cr>]])
end

return M
