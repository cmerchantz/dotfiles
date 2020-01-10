set nocompatible

syntax on
filetype on
colorscheme dim

set autoread
set scrolloff=1
set backspace=indent,eol,start
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set nojoinspaces
set ruler
set hlsearch incsearch ignorecase smartcase
set splitright
set wildmenu
set updatetime=100
set nolist

set t_te=""
au VimLeave * :!clear

if $ITERM_PROFILE == 'writing'
    set nonumber
else
    set number
endif

"Access a file that sources ~/.bash_aliases
let $BASH_ENV="~/.vim/vim_bashrc"

set tags=./.tags;~

"Highlighting
"------------
hi ColorColumn ctermbg=grey
hi Search ctermbg=4 ctermfg=black
hi SearchCurrent ctermbg=6 ctermfg=black
hi Cursor ctermfg=white
hi CursorLine ctermbg=darkgrey
hi CursorColumn ctermbg=darkgrey
hi Function2 cterm=bold
hi Folded ctermbg=magenta ctermfg=black
hi link notesDoubleQuoted Comment
hi SpellBad gui=underline cterm=underline ctermfg=red ctermbg=darkgrey
hi VertSplit ctermfg=247 ctermbg=233 guifg=#9e9e9e guibg=#121212
hi StatusLineNC ctermfg=247 ctermbg=233 guifg=#9e9e9e guibg=#121212
hi StatusLine ctermfg=247 ctermbg=233 guifg=#9e9e9e guibg=#121212
hi SpellCap gui=underline cterm=underline ctermbg=NONE ctermfg=yellow

"Python highlighting
"-------------------
let python_highlight_all = 1
let python_highlight_space_errors = 1

"Highlight 100th column for python files
"au BufNewFile,BufRead,BufReadPost *.py set colorcolumn=100

"Plugin Management
"-----------------

"plugins (vim-plug)
call plug#begin('~/.vim/plugged')
Plug 'timakro/vim-searchant'
Plug 'tmhedberg/SimpylFold'
Plug 'Konfekt/FastFold'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'ambv/black'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
"Plug 'xolox/vim-easytags'
Plug 'ludovicchabant/vim-gutentags'
Plug 'junegunn/fzf'
Plug 'thiagoalessio/rainbow_levels.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'lilydjwg/colorizer'
Plug 'jremmen/vim-ripgrep'
"Plug 'inkarkat/vim-mark'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'severin-lemaignan/vim-minimap'
Plug 'davidhalter/jedi-vim', { 'for':  'python' }
Plug 'majutsushi/tagbar'
Plug 'ervandew/supertab'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
"Plug 'thaerkh/vim-indentguides'
Plug 'wellle/context.vim'
Plug 'gerw/vim-HiLinkTrace'
Plug 'cespare/vim-toml'
Plug 'christoomey/vim-run-interactive'
call plug#end()

"Airline
if $ITERM_PROFILE == 'writing'
    let g:airline_theme = 'bubblegum'
else
    let g:airline_theme = 'powerlineish'
endif
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline_section_y = ''
let g:airline_skip_empty_sections = 1

"gitgutter
hi! link GitGutterAdd DiffAdd
hi! link GitGutterDelete DiffDelete
hi! link GitGutterChange DiffChange
hi! link GitGutterChangeDelete DiffChange
let g:gitgutter_async = 0
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '~-'
"let g:gitgutter_sign_added = '➕'
"let g:gitgutter_sign_modified = '〰️'
"let g:gitgutter_sign_removed = '➖'
"let g:gitgutter_sign_removed_first_line = '➖'
"let g:gitgutter_sign_modified_removed = '〰️'

"fugitive
autocmd FileType gitcommit set foldmethod=syntax

"vim-indent-guides
"let g:indent_guides_guide_size=1

"vim-minimap
let g:minimap_highlight = 'SearchCurrent'

"NERDTree
"leader mapping set below

"tagbar
let g:tagbar_sort = 0

"supertab
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = '<c-x><c-o>'

"black
let g:black_linelength = 100

"argrwap
nnoremap <silent> gw :ArgWrap<CR>
let g:argwrap_tail_comma = 1

"jedi-vim
"let g:jedi#auto_initialization = 0
let g:jedi#use_splits_not_buffers = 'left'
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = '2'
let g:jedi#goto_stubs_command = ""

"folding
let g:SimpylFold_docstring_preview = 1
set nofoldenable

"context.vim
let g:context_enabled = 0
"leader mapping set below

"easytags
"let g:easytags_cmd = '/usr/local/bin/ctags'
"let g:easytags_opts = ['-n']
"let g:easytags_dynamic_files = 1
"let g:easytags_file = '~/.tags'
"let g:easytags_syntax_keyword = 'always'
"let g:easytags_always_enabled = 1
"let g:easytags_autorecurse = 0
"let g:easytags_suppress_report = 1
"let b:easytags_auto_highlight = 0

"gutentags
let g:gutentags_ctags_tagfile = '.tags'

"Rainbow Levels
hi! RainbowLevel0 ctermfg=068 guifg=#6699cc
hi! RainbowLevel1 ctermfg=203 guifg=#ec5f67
hi! RainbowLevel2 ctermfg=221 guifg=#fac863
hi! RainbowLevel3 ctermfg=114 guifg=#99c794
hi! RainbowLevel4 ctermfg=176 guifg=#c594c5
hi! RainbowLevel5 ctermfg=209 guifg=#f99157
hi! RainbowLevel6 ctermfg=073 guifg=#62b3b2
hi! RainbowLevel7 ctermfg=137 guifg=#ab7967

"Preserve syntax highlighting, just color background
"hi! RainbowLevel0 ctermbg=240 guibg=#585858
"hi! RainbowLevel1 ctermbg=239 guibg=#4e4e4e
"hi! RainbowLevel2 ctermbg=238 guibg=#444444
"hi! RainbowLevel3 ctermbg=237 guibg=#3a3a3a
"hi! RainbowLevel4 ctermbg=236 guibg=#303030
"hi! RainbowLevel5 ctermbg=235 guibg=#262626
"hi! RainbowLevel6 ctermbg=234 guibg=#1c1c1c
"hi! RainbowLevel7 ctermbg=233 guibg=#121212

"ALE
let g:ale_enabled = 0
let g:ale_linters = {'python': ['flake8']}
let g:ale_python_flake8_options = '--max-line-length=100'
nmap <silent> [a <Plug>(ale_previous_wrap)
nmap <silent> ]a <Plug>(ale_next_wrap)
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

"User-defined commands
"---------------------

" Make a line have 'title case'
command TitleCase :s/\v<(.)(\w*)/\u\1\L\2/g

"fugitive-esque git diff --staged
command! Greview :Gtabedit @:% | Gdiff :

"Put the date
command! Date put =strftime('%Y-%m-%d')<CR>

"Split a line with S (analagous to J)
nnoremap S :keeppatterns substitute/\s*\%#\s*/\r/e <bar> normal! ==<CR>

"Insert the current date
command! Date put =strftime('%Y-%m-%d')

"Open a new buffer from search matches
command! -nargs=? Filter let @a='' | execute 'g/<args>/y A' | new | setlocal bt=nofile | put! a

"copy to clipboard
vnoremap <C-c> :w !pbcopy<CR><CR>

"empty all registers
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

"Git checkout branch w/autocomplete
function! s:changebranch(branch)
    execute 'Git checkout' . a:branch
    "call feedkeys("i")
endfunction

command! -bang Gcheckout call fzf#run({
            \ 'source': 'git branch -a --no-color | grep -v "^\* " ',
            \ 'sink': function('s:changebranch')
            \ })

"copy all search matches (not necessarily entire line)
function! CopyMatches(reg)
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/gne
  let reg = empty(a:reg) ? 'c' : a:reg
  execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)

"jump to next/previous fold
"nnoremap <silent> <leader>zj :call NextClosedFold('j')<cr>
"nnoremap <silent> <leader>zk :call NextClosedFold('k')<cr>
"
"function! NextClosedFold(dir)
"    let cmd = 'norm!z' . a:dir
"    let view = winsaveview()
"    let [l0, l, open] = [0, view.lnum, 1]
"    while l != l0 && open
"        exe cmd
"        let [l0, l] = [l, line('.')]
"        let open = foldclosed(l) < 0
"    endwhile
"    if open
"        call winrestview(view)
"    endif
"endfunction

"Mappings
"--------
:imap <Tab> <C-t>
:imap <S-Tab> <C-d>

"Leader Mappings
let mapleader = ' '

nnoremap <silent> <leader>a :ALEToggle<CR>
nnoremap <leader>b :Black<CR>
nnoremap <leader>c :ContextToggle<CR>
nnoremap <silent> <leader>f :FZF<CR>
noremap <leader>rl :RainbowLevelsToggle<cr>
nnoremap <leader>n :NERDTreeToggleVCS<CR>
nnoremap <silent> <leader>rg :Rg <C-R><C-W><CR>
nnoremap <leader>t :TagbarToggle<CR>
let g:jedi#rename_command = "<leader>re"
let g:jedi#usages_command = "<leader>u"
