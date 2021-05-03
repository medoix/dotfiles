"'' VIM PRE-PLUG ''"
set hidden
set nobackup
set nocompatible
set nowritebackup
set secure
set shortmess+=c
set termguicolors
set updatetime=300
syntax enable

"'' START PLUG ''"
call plug#begin('~/.config/nvim/plugged')

"'' Telescope ''"
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"'' Language Support ''""
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

"'' Themes ''"
Plug 'folke/tokyonight.nvim'

"'' Utilities ''"
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons' " Icons for lualine
Plug 'voldikss/vim-floaterm'

call plug#end()
"'' END PLUG ''"

"'' Tokyonight ''"
if filereadable(expand("~/.config/nvim/plugged/tokyonight.nvim/lua/tokyonight/init.lua"))
  let g:tokyonight_style = "night"
  let g:tokyonight_enable_italic = 1
  "let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]
endif

"'' VIM POST-PLUG ''"
silent! colorscheme tokyonight
set splitright
set encoding=utf-8
set noerrorbells
set tabstop=2
set shiftwidth=2
set expandtab
set nowrap
set number
set noshowmode
set relativenumber "" PogChamp
set scrolloff=3
set signcolumn=number
"hi Normal guibg=NONE ctermbg=NONE
"hi EndOfBuffer guibg=NONE ctermbg=NONE

augroup WrapInMarkdown
  autocmd!
  autocmd FileType markdown setlocal wrap
augroup END

"'' Mouse Support ''"
if has('mouse')
    set mouse=a
endif

"'' Allow vim to set a custom font or color for a word
syntax enable

"'' Leader Key ''"
let mapleader = " "

"'' VIM Keymaps ''"
nmap <leader>h :wincmd h<CR>
nmap <leader>j :wincmd j<CR>
nmap <leader>k :wincmd k<CR>
nmap <leader>l :wincmd l<CR>

"'' Floatterm ''"
if filereadable(expand("~/.config/nvim/plugged/vim-floaterm/plugin/floaterm.vim"))
  nnoremap <leader>ld :FloatermNew --autoclose=2 --height=0.9 --width=0.9 --wintype=floating lazydocker<CR>
  nnoremap <leader>lg :FloatermNew --autoclose=2 --height=0.9 --width=0.9 --wintype=floating lazygit<CR>
  nnoremap <leader>rr :FloatermNew --autoclose=2 --height=0.75 --width=0.75 --wintype=floating ranger<CR>
  nnoremap <leader>tt :FloatermNew --autoclose=2 --height=0.9 --width=0.9 --wintype=floating<CR>
endif

"'' Remove trailing white spaces on save ''"
autocmd BufWritePre * :%s/\s\+$//e

"----------------------------------------------
" Editing
"----------------------------------------------
" Compete options for the pop up menu for autocompletion.
set completeopt=menu,noselect

" remove the horrendous preview window
set completeopt-=preview

"----------------------------------------------
" Plugin: hoob3rt/lualine.nvim
"----------------------------------------------
let g:lualine = {
    \'options' : {
    \  'theme' : 'tokyonight',
    \  'section_separators' : ['', ''],
    \  'component_separators' : ['', ''],
    \  'disabled_filetypes' : [],
    \  'icons_enabled' : v:true,
    \},
    \'sections' : {
    \  'lualine_a' : [ ['mode', {'upper': v:true,},], ],
    \  'lualine_b' : [ ['branch', {'icon': '',}, ], ],
    \  'lualine_c' : [ ['filename', {'file_status': v:true,},], ],
    \  'lualine_x' : [ 'encoding', 'fileformat', 'filetype' ],
    \  'lualine_y' : [ 'progress' ],
    \  'lualine_z' : [ 'location'  ],
    \},
    \'inactive_sections' : {
    \  'lualine_a' : [  ],
    \  'lualine_b' : [  ],
    \  'lualine_c' : [ 'filename' ],
    \  'lualine_x' : [ 'location' ],
    \  'lualine_y' : [  ],
    \  'lualine_z' : [  ],
    \},
    \'extensions' : [ ],
    \}
lua require("lualine").setup()

"----------------------------------------------
" Language: Golang
"----------------------------------------------
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

" Mappings
au FileType go nmap <F8> :GoMetaLinter<cr>
au FileType go nmap <F9> :GoCoverageToggle -short<cr>
au FileType go nmap <F10> :GoTest -short<cr>
au FileType go nmap <F12> <Plug>(go-def)
au Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
au Filetype go nmap <leader>gah <Plug>(go-alternate-split)
au Filetype go nmap <leader>gav <Plug>(go-alternate-vertical)
au FileType go nmap <leader>gt :GoDeclsDir<cr>
au FileType go nmap <leader>gc <Plug>(go-coverage-toggle)
au FileType go nmap <leader>gd <Plug>(go-def)
au FileType go nmap <leader>gdv <Plug>(go-def-vertical)
au FileType go nmap <leader>gdh <Plug>(go-def-split)
au FileType go nmap <leader>gD <Plug>(go-doc)
au FileType go nmap <leader>gDv <Plug>(go-doc-vertical)

au filetype go inoremap <buffer> . .<C-x><C-o>

" Run goimports when running gofmt
let g:go_fmt_command = "goimports"

" Set neosnippet as snippet engine
let g:go_snippet_engine = "neosnippet"

" Enable syntax highlighting per default
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1

" Show the progress when running :GoCoverage
let g:go_echo_command_info = 1

" Show type information
let g:go_auto_type_info = 1

" Highlight variable uses
let g:go_auto_sameids = 1

" Fix for location list when vim-go is used together with Syntastic
let g:go_list_type = "quickfix"

" Using gopls to find definitions and information.
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Add the failing test name to the output of :GoTest
let g:go_test_show_name = 1

" gometalinter configuration
let g:go_metalinter_command = ""
let g:go_metalinter_deadline = "5s"
let g:go_metalinter_enabled = [
    \ 'deadcode',
    \ 'gas',
    \ 'goconst',
    \ 'gocyclo',
    \ 'golint',
    \ 'gosimple',
    \ 'ineffassign',
    \ 'vet',
    \ 'vetshadow'
\]

" Set whether the JSON tags should be snakecase or camelcase.
let g:go_addtags_transform = "snakecase"

" neomake configuration for Go.
let g:neomake_go_enabled_makers = [ 'go', 'gometalinter' ]
let g:neomake_go_gometalinter_maker = {
  \ 'args': [
  \   '--tests',
  \   '--enable-gc',
  \   '--concurrency=3',
  \   '--fast',
  \   '-D', 'aligncheck',
  \   '-D', 'dupl',
  \   '-D', 'gocyclo',
  \   '-D', 'gotype',
  \   '-E', 'misspell',
  \   '-E', 'unused',
  \   '%:p:h',
  \ ],
  \ 'append_file': 0,
  \ 'errorformat':
  \   '%E%f:%l:%c:%trror: %m,' .
  \   '%W%f:%l:%c:%tarning: %m,' .
  \   '%E%f:%l::%trror: %m,' .
  \   '%W%f:%l::%tarning: %m'
  \ }

