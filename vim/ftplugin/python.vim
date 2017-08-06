set expandtab "preferred for python
set textwidth=99
set colorcolumn=100 "visual indicator

"deoplete-jedi: completion server
let g:deoplete#sources#jedi#python_path = '/home/toban/utilities/anaconda3/bin/python' "req'd even with anaconda in PYTHONPATH
let g:deoplete#sources#jedi#server_timeout = 60 "give enough time for large packages to load, e.g., pandas 
let g:deoplete#sources#jedi#show_docstring = 1 "show docstring in preview window
