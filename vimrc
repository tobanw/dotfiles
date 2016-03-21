" Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

"------------------------------------------------
" vim-plug config

" Required:
call plug#begin('~/.vim/plugged')

" My plugins:
Plug 'tpope/vim-fugitive' "git wrapper
Plug 'Shougo/unite.vim'
Plug 'Shougo/neocomplete.vim'
Plug 'davidhalter/jedi-vim' "python autocompletion
Plug 'ervandew/supertab' "tab completion
Plug 'scrooloose/syntastic' "syntax checker
Plug 'ivanov/vim-ipython'
Plug 'Raimondi/delimitMate'
Plug 'vim-airline/vim-airline'
Plug 'JuliaLang/julia-vim'
Plug 'vim-latex/vim-latex' " vim latex suite
Plug 'tmhedberg/SimpylFold' "python code folding
Plug 'Konfekt/FastFold' " folding performance
"Plug 'greyblake/vim-preview'
Plug 'tobanw/vim-preview' "markdown to html (my fork with mathjax enabled)
Plug 'morhetz/gruvbox' "256 color scheme

"Plug 'vim-scripts/Smart-Tabs' "tabs for indent, spaces for alignment
" Smart-Tabs conflicts with supertab

"Plug 'ardagnir/vimbed'
"Plug 'altercation/vim-colors-solarized'
"Plug 'vim-scripts/CSApprox'
"Plug 'flazz/vim-colorschemes'

" Required:
call plug#end()

"------------------------------------------------

"various
filetype plugin indent on
syntax enable
set background=dark
set guifont=Inconsolata\ Bold\ 14

"gruvbox colorscheme
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

"enable backup files, and put backup and swap files in ~/.vim/backup
set backup
set backupdir=~/.vim/backup
set dir=~/.vim/backup

"line numbering on
set number

"tabs
set noexpandtab "don't convert tabs to spaces
set tabstop=4 "tab is 4 characters
set shiftwidth=4 "indenting motion <</>>
set softtabstop=4 " backspace over expanded tabs
set autoindent

"defaults, overridden by ftplugin
set textwidth=0

"lines to keep above/below cursor
set scrolloff=3

"hide menu bar, toolbar, scrollbar
set guioptions=ai

"airline
set laststatus=2
"enable top tab bar
"let g:airline#extensions#tabline#enabled = 1

"supertab: set to user completion
let g:SuperTabDefaultCompletionType = "context"
"tab goes down the list
let g:SuperTabContextDefaultCompletionType = "<c-n>"

"jedi-vim (disable auto-complete on .)
let g:jedi#popup_on_dot = 0
"don't highlight first entry
let g:jedi#popup_select_first = 0

"vim-latex: the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

"neocomplete -- some config options from readme ---------------------
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" make neocomplcache use jedi#completions omni function for python scripts
if !exists('g:neocomplcache_omni_functions')
    let g:neocomplcache_omni_functions = {}
    let g:neocomplcache_omni_functions['python'] = 'jedi#completions'
endif
" make Vim call omni function when below patterns matchs
let g:neocomplcache_force_omni_patterns = {}
let g:neocomplcache_force_omni_patterns.python = '[^. \t]\.\w*'
"---------------------------------------------------------------------
