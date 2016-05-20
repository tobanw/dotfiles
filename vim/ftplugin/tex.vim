
"LATEX-SUITE---------------------
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" set biblatex to use biber: 
let g:Tex_BibtexFlavor='biber'

"compile with xelatex
let g:Tex_CompileRule_pdf='xelatex --interaction=nonstopmode $*'

" sets pdf as default for compile/view
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf,aux'

" set viewer as zathura
let g:Tex_ViewRule_pdf = 'zathura'


" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:


" \k to save and compile
nmap <leader>k :w<CR> <leader>ll

" `j for inline math delimiters: \(\)
:call IMAP('`j', '\( <++> \)<++>', 'tex')

" compile main file in modular documents
" Look for main file by looking in the first 20 lines, same as TeXShop, for:
" % !TEX root = [filename].tex
" Author: Seth R. Johnson
let g:Tex_MainFileExpression = 'SRJMainFile(modifier)'

function! SRJMainFile(fmod)
	let s:Tex_Match = '\v^\s*\%\s*!TEX\s+root\s*\=\s*\zs(.*\.tex)\ze\s*$'
    let s:lnum = 1
    while s:lnum < 20
		let s:basefile = matchstr( getline(s:lnum), s:Tex_Match)
		if !empty(s:basefile)
			break
		endif
		let s:lnum += 1
    endwhile

	if !empty(s:basefile)
		let s:origdir = fnameescape(getcwd())
		let s:newdir = fnameescape(expand('%:p:h'))
		exec 'cd'.s:newdir
		let s:basefile = fnamemodify(s:basefile, a:fmod) 
		exec 'cd'.s:origdir
	else
		let s:basefile = expand('%'.a:fmod)
	endif

	return s:basefile
endfunction
"--------------------------------
