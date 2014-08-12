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
"NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'ervandew/supertab'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'ivanov/vim-ipython'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'bling/vim-airline'
NeoBundle 'ardagnir/vimbed'
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


syntax enable
colorscheme slate
set background=dark

"enable backup files, and put backup and swap files in ~/.vimtmp
set backup
set backupdir=~/.vimtmp
set dir=~/.vimtmp

"line numbering on
set number

"hide menu bar and toolbar
set guioptions-=m
set guioptions-=T

"supertab: set to user completion
let g:SuperTabDefaultCompletionType = "context"

"jedi-vim (disable auto-complete on .)
let g:jedi#popup_on_dot = 0

"airline
set laststatus=2

"LATEX-SUITE---------------------
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" sets pdf as default for compile/view
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf,aux'
"--------------------------------
