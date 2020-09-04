set noexpandtab tabstop=4 shiftwidth=4 noautoindent linebreak

"Enable vimtex folding
set foldmethod=expr
set foldexpr=vimtex#fold#level(v:lnum)
set foldtext=vimtex#fold#text()

" Don't fold any environments by default
let g:vimtex_fold_types = { 'envs' : {'whitelist': []} }
