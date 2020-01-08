set nocompatible

syntax on
colorscheme dim

set autoread
set scrolloff=1
set backspace=indent,eol,start
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set nojoinspaces
set ruler
set hlsearch
set noincsearch
set splitright
set wildmenu
set ignorecase smartcase

if $ITERM_PROFILE == 'writing'
    set nonumber
else
    set number
endif

"See also easytags configuration
set tags=./.tags;,~/.vimtags

let mapleader = ' '

"Highlighting
"------------
hi ColorColumn ctermbg=grey
hi Search ctermbg=2 ctermfg=black
hi SearchCurrent ctermbg=3 ctermfg=black
hi Cursor ctermfg=white
hi CursorLine ctermbg=darkgrey
hi CursorColumn ctermbg=darkgrey
hi Function2 cterm=bold
hi Folded ctermbg=green ctermfg=white
hi link notesDoubleQuoted Comment
hi clear SpellBad
hi SpellBad gui=underline cterm=underline ctermfg=red
hi VertSplit ctermfg=247 ctermbg=233 guifg=#9e9e9e guibg=#121212
hi StatusLineNC ctermfg=247 ctermbg=233 guifg=#9e9e9e guibg=#121212
hi StatusLine ctermfg=247 ctermbg=233 guifg=#9e9e9e guibg=#121212

"Leader Mappings
"--------
map <leader>b :Black<cr>
map <leader>d :put =strftime('%Y-%m-%d')<cr>
nnoremap <silent> <leader>f :FZF<cr>
nnoremap <silent> <Leader>rg :Rg <C-R><C-W><CR>
map <leader>m :MinimapToggle<CR>
map <leader>s :set spell!<cr>
map <leader>u :buffers<cr>
nnoremap <leader>c :ColorToggle<cr>

"Other mappings
"--------------

"'Split' line, simlar functionality to J
nnoremap S :keeppatterns substitute/\s*\%#\s*/\r/e <bar> normal! ==<CR>


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
Plug 'mpyatishev/vim-sqlformat'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-easytags'
Plug 'junegunn/fzf'
Plug 'thiagoalessio/rainbow_levels.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'lilydjwg/colorizer'
Plug 'jremmen/vim-ripgrep'
"Plug 'inkarkat/vim-mark'
Plug 'vim-scripts/Align' "required for SQLUtilities
Plug 'vim-scripts/SQLUtilities'
"Plug 'https://github.com/vim-scripts/highlight.vim'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'severin-lemaignan/vim-minimap'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'alvan/vim-closetag'
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


"NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>


"SQLUtilities
"let g:sqlutil_keyword_case = '\U'
"vmap <silent>sf <Plug>SQLUFormatter<CR>

"black
let g:black_linelength = 100

"argrwap
nnoremap <silent> gw :ArgWrap<CR>
let g:argwrap_tail_comma = 1

"folding
let g:SimpylFold_docstring_preview = 1
set nofoldenable

"easytags
let g:easytags_cmd = '/usr/local/bin/ctags'
let g:easytags_opts = ['-n']
let g:easytags_dynamic_files = 1
let g:easytags_file = '~/.vimtags'
let g:easytags_syntax_keyword = 'always'
let g:easytags_always_enabled = 1
let g:easytags_autorecurse = 0
let g:easytags_suppress_report = 1

"Rainbow Levels
map <leader>l :RainbowLevelsToggle<cr>
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

"vim-minimap
let g:minimap_highlight='SignColumn'

"indent-guides
let g:indent_guides_guide_size = 1

"User-defined commands
"---------------------

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

"ALE
nnoremap <silent> <leader>a :ALEToggle<CR>
let g:ale_enabled = 0

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
