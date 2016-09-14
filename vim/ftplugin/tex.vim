" VIMTEX-------------------------

" \k to save and compile (single shot)
nmap <leader>k :w<CR> :VimtexCompileSS<CR>

" viewer
let g:vimtex_view_method = 'zathura'

" latexmk: use separate output files directory
let g:vimtex_latexmk_build_dir = 'build'

" deoplete completions for vimtex
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = '\\(?:'
	\ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
	\ . '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
	\ . '|hyperref\s*\[[^]]*'
	\ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
	\ . '|(?:include(?:only)?|input)\s*\{[^}]*'
	\ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
	\ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
	\ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
	\ .')'
