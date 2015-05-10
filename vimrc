"------------------------------------------------
"neobundle config
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'tpope/vim-fugitive' "git wrapper
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'ervandew/supertab'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'ivanov/vim-ipython'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'bling/vim-airline'
NeoBundle 'JuliaLang/julia-vim'
NeoBundle 'vim-latex/vim-latex'
NeoBundle 'vim-scripts/Smart-Tabs' "tabs for indent, spaces for alignment

"NeoBundle 'ardagnir/vimbed'
"NeoBundle 'altercation/vim-colors-solarized'
"NeoBundle 'vim-scripts/CSApprox'
"NeoBundle 'flazz/vim-colorschemes'

" You can specify revision/branch/tag.
"NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"end neobundle
"------------------------------------------------

"various
syntax enable
colorscheme slate
set background=dark
set guifont=Inconsolata\ Bold\ 12

"enable backup files, and put backup and swap files in ~/.vimtmp
set backup
set backupdir=~/.vimtmp
set dir=~/.vimtmp

"line numbering on
set number

"tabs
set noexpandtab "don't convert tabs to spaces
set tabstop=4 "tab is 4 characters
set shiftwidth=4 "indenting motion <</>>
set softtabstop=4 " backspace over expanded tabs
set autoindent

"lines to keep above/below cursor
set scrolloff=3

"hide menu bar and toolbar
set guioptions-=m
set guioptions-=T

"airline
set laststatus=2

"supertab: set to user completion
let g:SuperTabDefaultCompletionType = "context"
"tab goes down the list
let g:SuperTabContextDefaultCompletionType = "<c-n>"

"jedi-vim (disable auto-complete on .)
let g:jedi#popup_on_dot = 0
"don't highlight first entry
let g:jedi#popup_select_first = 0

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

"LATEX-SUITE---------------------
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" sets pdf as default for compile/view
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf,aux'

" set viewer as zathura
let g:Tex_ViewRule_pdf = 'zathura'
"--------------------------------