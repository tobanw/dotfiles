" Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

"------------------------------------------------
" vim-plug config

" Required:
if has('nvim')
	call plug#begin('~/.config/nvim/plugged')
else
	call plug#begin('~/.vim/plugged')
endif

" My plugins:
Plug 'francoiscabrol/ranger.vim' "ranger integration
Plug 'tpope/vim-fugitive' "git wrapper
Plug 'junegunn/fzf.vim' "fuzzy finder
Plug 'ervandew/supertab' "tab completion
Plug 'neomake/neomake' "async syntax checker
Plug 'ivanov/vim-ipython'
Plug 'Raimondi/delimitMate' "auto insert matching delimiters
Plug 'tpope/vim-surround' "text-object mappings for delimiters
Plug 'tpope/vim-repeat' "provides repeat for compatible plugins
Plug 'vim-airline/vim-airline' "airline status bar
Plug 'JuliaEditorSupport/julia-vim'
Plug 'lervag/vimtex' "latex
Plug 'tmhedberg/SimpylFold' "python code folding
Plug 'Konfekt/FastFold' "folding performance
Plug 'tobanw/vim-preview' "markdown preview (fork of 'greyblake/vim-preview' with mathjax enabled)
Plug 'morhetz/gruvbox' "256 color scheme

" neovim only
if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'} "async completions
	Plug 'JuliaEditorSupport/deoplete-julia'
	Plug 'zchee/deoplete-jedi' "python completions
	Plug 'rbgrouleff/bclose.vim' "neovim dependency for ranger.vim
else " vim only
	Plug 'Shougo/neocomplete.vim'
	Plug 'davidhalter/jedi-vim' "python completions
endif

"Plug 'vim-scripts/Smart-Tabs' "tabs for indent, spaces for alignment
" Smart-Tabs conflicts with supertab

" Discard pile
"Plug 'Shougo/unite.vim'
"Plug 'ardagnir/vimbed'

" Required:
call plug#end()

"------------------------------------------------

"note: neovim already uses sensible defaults; see `:help defaults`
"for vim, use `tpope/vim-sensible`

"filetype plugin indent on
"syntax enable
"set autoindent

"enable backup files, and put backup and swap files in same place as ShaDa
" neovim defaults
"set backupdir=~/.local/share/nvim/backup
"set dir=~/.local/share/nvim/swap

"looks
set background=dark
set guifont=Inconsolata\ Bold\ 14

"gruvbox colorscheme
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

"yank to end of line
nnoremap Y y$

"line numbering on
set number

"tabs
set noexpandtab "don't convert tabs to spaces
set tabstop=4 "tab is 4 characters
set shiftwidth=4 "indenting motion <</>>
set softtabstop=4 " backspace over expanded tabs

"defaults, overridden by ftplugin
set textwidth=0

"lines to keep onscreen above/below cursor
set scrolloff=3

"hide menu bar, toolbar, scrollbar
set guioptions=ai

"vim-preview: browser priority
let g:PreviewBrowsers = "qutebrowser,firefox,chromium"

"airline
set laststatus=2
"enable top tab bar
"let g:airline#extensions#tabline#enabled = 1

"supertab: set to user completion
let g:SuperTabDefaultCompletionType = "context"
"tab goes down the list
let g:SuperTabContextDefaultCompletionType = "<c-n>"
"close the preview window after completing
let g:SuperTabClosePreviewOnPopupClose = 1

" The filetype of empty .tex files defaults to 'plaintex'
" instead of 'tex', which results in latex plugins not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

"neomake
"auto-lint on write
autocmd! BufWritePost * Neomake
"choose syntax checkers
let g:neomake_python_enabled_makers = ['flake8']

"deoplete
let g:deoplete#enable_at_startup = 1
