" Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
	set nocompatible               " Be iMproved
endif

"------------------------------------------------
" vim-plug config

" install vim-plug if not present
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
	     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Required:
if has('nvim')
	call plug#begin('~/.local/share/nvim/plugged')
else
	call plug#begin('~/.vim/plugged')
endif

" My plugins:
Plug 'justinmk/vim-dirvish' "lean file explorer
Plug 'junegunn/fzf.vim' "fuzzy finder
Plug 'ervandew/supertab' "tab completion
"Plug 'vim-scripts/Smart-Tabs' "tabs to indent, spaces to align (conflicts with supertab)
Plug 'neomake/neomake' "async syntax checker
Plug 'Raimondi/delimitMate' "auto insert matching delimiters
Plug 'tpope/vim-fugitive' "git wrapper
Plug 'tpope/vim-surround' "text-object mappings for delimiters
Plug 'tpope/vim-repeat' "provides repeat for compatible plugins
Plug 'tpope/vim-commentary' "mappings for commenting code
Plug 'tpope/vim-capslock' "software capslock toggle: gC
Plug 'vim-airline/vim-airline' "airline status bar
Plug 'RRethy/vim-illuminate' "highlight instances of word under cursor
Plug 'JuliaEditorSupport/julia-vim'
Plug 'lervag/vimtex' "latex
Plug 'tmhedberg/SimpylFold' "python code folding
Plug 'Konfekt/FastFold' "folding performance
Plug 'morhetz/gruvbox' "256 color scheme

" neovim only
if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'} "async completions
	Plug 'zchee/deoplete-jedi' "python completions

	" repl integration using neovim terminal
	" NOTE: needs nvim 0.5; 0.4.4 doesn't support `nvim_buf_set_extmark`
	Plug 'hkupty/iron.nvim'

	" markdown renderer: if you don't have nodejs and yarn, use pre build
	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
else " vim only
	Plug 'Shougo/neocomplete.vim'
	Plug 'davidhalter/jedi-vim' "python completions
endif


" Discard pile
"Plug 'Shougo/unite.vim'
"Plug 'ardagnir/vimbed'
"Plug 'ivanov/vim-ipython'
"Plug 'tobanw/vim-preview' "markdown preview (fork of 'greyblake/vim-preview' with mathjax enabled)
"Plug 'francoiscabrol/ranger.vim' "ranger integration
"Plug 'rbgrouleff/bclose.vim' "neovim dependency for ranger.vim

" Required:
call plug#end()

"------------------------------------------------

"note: neovim already uses sensible defaults; see `:help defaults`
"for vim, use `tpope/vim-sensible`

"filetype plugin indent on
"syntax enable
"set autoindent

"enable backup files, and put backup files in same place as swap
set backupdir=~/.local/share/nvim/backup
set writebackup
" neovim uses proper default for swap
"set dir=~/.local/share/nvim/swap

"looks
set background=dark
set guifont=Inconsolata\ Bold\ 14

"gruvbox colorscheme
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

"briefly highlight yanked region
au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}

"yank to end of line
nnoremap Y y$

"ignore case unless caps used
set ignorecase
set smartcase

"line numbering on
set number

"tabs
set noexpandtab "don't convert tabs to spaces
set tabstop=4 "tab is 4 characters
set shiftwidth=4 "indenting motion <</>>
set softtabstop=4 " backspace over expanded tabs

"indentation: indent with tabs (variable width per editor), align with spaces
set copyindent "copy indent from previous line
set list listchars=tab:>-,trail:.,extends:>,precedes:< "display tabs and trailing spaces

"defaults, overridden by ftplugin
set textwidth=0 " max line length (0 disables)

"don't doublespace when joining lines containing sentences
set nojoinspaces

"lines to keep onscreen above/below cursor
set scrolloff=3

"split diffs vertically
set diffopt+=vertical

"window navigation with Ctrl+h/j/k/l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"natural split opening
set splitright
set splitbelow

"terminal mode: esc to exit
tnoremap <Esc> <C-\><C-n>

" Gvim: hide menu bar, toolbar, scrollbar
set guioptions=ai

"netrw (built-in file explorer)
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

"airline
set laststatus=2
"enable top tab bar
"let g:airline#extensions#tabline#enabled = 1

"supertab: set to user completion
let g:SuperTabDefaultCompletionType = "context"
"tab goes down the list
let g:SuperTabContextDefaultCompletionType = "<c-n>"
"auto-close the preview window after completing (or :pc[lose] manually)
"let g:SuperTabClosePreviewOnPopupClose = 1

" The filetype of empty .tex files defaults to 'plaintex'
" instead of 'tex', which results in latex plugins not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

"neomake
"auto-lint on read (after 1s) and write
call neomake#configure#automake('rw', 1000)
"choose syntax checkers
let g:neomake_python_enabled_makers = ['pylint'] "anaconda or system package
let g:neomake_julia_enabled_makers = ['lint'] "julia package: Lint.jl
let g:neomake_r_enabled_makers = ['lintr'] "r package
let g:neomake_javascript_enabled_makers = ['eslint'] "system package
let g:neomake_markdown_enabled_makers = ['mdl'] "ruby gem
let g:neomake_zsh_enabled_makers = ['zsh']
let g:neomake_sql_enabled_makers = ['sqlint'] "system package
let g:neomake_sh_enabled_makers = ['shellcheck'] "system package

"deoplete
let g:deoplete#enable_at_startup = 1

"iron.nvim: send code chunks to repl
luafile $XDG_CONFIG_DIR/nvim/plugins.lua

