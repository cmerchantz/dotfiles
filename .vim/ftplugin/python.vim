"Tab stuff for python: no tabs, only spaces, indents are 4 spaces wide
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab autoindent

"Max line length is 100 characters
set textwidth=100 

"Use 'python' to run python files
set makeprg=python

"These affect vim highlight groups for python
let python_highlight_all = 1
let python_highlight_space_errors = 1

"Use Black as the formatter for python files
nnoremap <leader>gq :Black<CR>
