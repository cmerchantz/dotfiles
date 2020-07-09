set nocompatible

syntax on
filetype on
colorscheme dim
set notermguicolors

set autoread
set backspace=indent,eol,start
set hidden
set smarttab
set nojoinspaces
set nofoldenable
set ruler
set hlsearch incsearch ignorecase smartcase
set splitright
set wildmenu
set updatetime=100
set nolist
set scrolloff=1
set sidescrolloff=1

set showbreak=↪
set listchars=tab:——❩,nbsp:␣,trail:•,extends:᠁,precedes:᠁

set t_te=""
au VimLeave * :!clear

if $ITERM_PROFILE == 'writing'
    set nonumber
else
    set number
endif

"Access a file that sources ~/.bash_aliases
let $BASH_ENV="~/.vim/vim_bashrc"

"See also easytags configuration
set tags=./.tags;~

set tabstop=4 softtabstop=4 shiftwidth=4

"Filetype-specific configuration
"-------------------------------
"Python file autocommands
au BufNewFile,BufRead *.py
  \ set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=100 expandtab autoindent fileformat=unix

"Web file autocommands
au BufNewFile,BufRead *.js, *.html, *.css
  \ set tabstop=2 softtabstop=2 shiftwidth=2

"RestructuredText autocommands
au BufNewFile,BufRead *.rst
  \ set tabstop=3 softtabstop=3 shiftwidth=3 expandtab autoindent

"LaTeX autocommands
au BufNewFile,BufRead *.tex
  \ set noexpandtab tabstop=4 shiftwidth=4 noautoindent

"Shell script autocommands
au BufNewFile,BufRead *.sh
  \ set noexpandtab tabstop=4 shiftwidth=4 list
  \ | silent! call airline#extensions#whitespace#disable()

"Highlighting
"------------
"This is put in a function so that it can be re-applied when leaving Goyo
function! ApplyHighlighting()

  hi ColorColumn ctermbg=grey
  hi Search ctermbg=2 ctermfg=0
  hi SearchCurrent ctermbg=2 ctermfg=7
  hi Cursor ctermfg=white
  hi CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE
  hi CursorLineNr cterm=NONE  ctermfg=yellow
  hi CursorColumn ctermbg=darkgrey
  hi Function2 cterm=bold
  hi Folded ctermbg=NONE ctermfg=magenta
  hi SpellBad gui=underline cterm=underline ctermfg=red ctermbg=darkgrey guifg=red guibg=darkgrey
  hi VertSplit ctermfg=247 ctermbg=233 guifg=#9e9e9e guibg=#121212
  hi StatusLineNC ctermfg=247 ctermbg=233 guifg=#9e9e9e guibg=#121212
  hi StatusLine ctermfg=247 ctermbg=233 guifg=#9e9e9e guibg=#121212
  hi SpellCap gui=underline cterm=underline ctermbg=NONE ctermfg=yellow
  hi diffAdded ctermfg=2 guifg=#009900
  hi diffChanged ctermfg=3 guifg=#bbbb00
  hi diffRemoved ctermfg=1 guifg=#ff2222
  hi clear Conceal
  hi clear SignColumn

endfunction

call ApplyHighlighting()

"Python highlighting
"-------------------
let python_highlight_all = 1
let python_highlight_space_errors = 1

"Highlight 100th column for python files
"au BufNewFile,BufRead,BufReadPost *.py set colorcolumn=100

"Plugin Management
"-----------------
"Done with vim-plug.

"Bootstrap installation of vim-plug if need be
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Specify plugins between the calls to plug#begin and plug#end
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'
Plug 'FooSoft/vim-argwrap'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'timakro/vim-searchant'
Plug 'tmhedberg/SimpylFold'
Plug 'Konfekt/FastFold'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'psf/black', { 'commit': 'ce14fa8b497bae2b50ec48b3bd7022573a59cdb1' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'ludovicchabant/vim-gutentags'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'thiagoalessio/rainbow_levels.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'lilydjwg/colorizer'
Plug 'jremmen/vim-ripgrep'
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
Plug 'wellle/context.vim'
Plug 'gerw/vim-HiLinkTrace'
Plug 'cespare/vim-toml'
Plug 'christoomey/vim-run-interactive'
Plug 'djoshea/vim-autoread'
Plug 'mgedmin/coverage-highlight.vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-eunuch'
Plug 'lervag/vimtex'
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
Plug 'junegunn/vim-emoji'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"Plug 'DanilaMihailov/beacon.nvim'
Plug 'junegunn/vim-after-object'
Plug 'jrudess/vim-foldtext'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'racer-rust/vim-racer', { 'for': 'rust' }
Plug 'rhysd/rust-doc.vim', { 'for': 'rust' }
call plug#end()

"vim-after-object
autocmd VimEnter * call after_object#enable(['a', 'b'], '=', ':', '-', '#', ' ')

"beacon.nvim
let g:beacon_ignore_filetypes = ['fzf', 'vim-plug']

"Airline
if $ITERM_PROFILE == 'writing'
    let g:airline_theme = 'bubblegum'
else
    let g:airline_theme = 'powerlineish'
endif
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline_powerline_fonts = 1
let g:airline_section_y = ''
let g:airline#extensions#whitespace#enabled = 1

"fzf
let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --exclude .git --exclude __pycache__/'

"gitgutter
hi! link GitGutterAdd DiffAdd
hi! link GitGutterDelete DiffDelete
hi! link GitGutterChange DiffChange
hi GitGutterChangeDelete ctermbg=3 ctermfg=1 guibg=#bbbb00 guifg=#dd0000
let g:gitgutter_async = 0
let g:gitgutter_sign_added = '\ +'
let g:gitgutter_sign_modified = '\ ~'
let g:gitgutter_sign_removed = '\ −'
let g:gitgutter_sign_removed_first_line = '\ −'
let g:gitgutter_sign_modified_removed = '\ ~'
"leader mapping set below

"fugitive
autocmd FileType gitcommit set foldmethod=syntax

"vim-minimap
let g:minimap_highlight = 'SearchCurrent'

"NERDTree
"leader mapping set below

"tagbar
let g:tagbar_sort = 0

"supertab
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = '<c-x><c-o>'
let g:SuperTabClosePreviewOnPopupClose = 1

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

"SimpylFold
let g:SimpylFold_docstring_preview = 1

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
let g:gutentags_file_list_command = 'rg --files'
let g:gutentags_project_root = ['.root']
let g:gutentags_generate_on_missing=1
let g:gutentags_generate_on_write=1
let g:gutentags_background_update=1
let g:gutentags_ctags_executable_rust = '$HOME/.vim/gutentags-rust.sh'

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

"limelight.vim
let g:limelight_conceal_ctermfg = 240

"Goyo
let g:goyo_width = '80%'
let g:goyo_height = '85%'

function! s:goyo_enter()

  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999

  Limelight
  let g:airline#extensions#tabline#enabled = 0

  " Allow quitting Vim if this is the only remaining buffer
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!

endfunction

function! s:goyo_leave()

  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5

  Limelight!
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#show_buffers = 1
  AirlineRefresh

  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  else
    call ApplyHighlighting()
  endif

endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"ALE
let g:ale_enabled = 1
let g:ale_linters = {
	\ 'python': ['flake8'],
	\ 'rust': ['rls'],
\ }
let g:ale_fixers = {'rust': ['rustfmt']}
let g:ale_python_flake8_options = '--max-line-length=100'
let g:ale_virtualenv_dir_names = []
let g:ale_sign_error = '⛔️'
let g:ale_sign_warning = '⚠️'

highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

nmap <silent> [a <Plug>(ale_previous_wrap)
nmap <silent> ]a <Plug>(ale_next_wrap)

"Use rustup setting for each rust project
let g:ale_rust_rls_toolchain = ''

"vim-latex-live-preview
"let g:livepreview_previewer = 'evince'
"let g:livepreview_engine = '/Library/TeX/texbin/pdflatex'

"vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='skim'
let g:vimtex_quickfix_mode=0
let g:vimtex_indent_enabled=0
set conceallevel=1

"tex-conceal.vim
let g:tex_conceal='abdmg'

"ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


"vim-racer
let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1

"vim-snippets
"Use numpy-style docstrings
let g:ultisnips_python_style = 'numpy'
"Prefer the use of double quotes, which matches black's preferred quoting style
let g:ultisnips_python_quoting_style = 'double'

"User-defined commands
"---------------------

" Make a line have 'title case'
command TitleCase :s/\v<(.)(\w*)/\u\1\L\2/g

"fugitive-esque git diff --staged
command! Greview :Gtabedit @:% | Gdiff :

"Split a line with S (analagous to J)
nnoremap S :keeppatterns substitute/\s*\%#\s*/\r/e <bar> normal! ==<CR>

"Insert the current date
command! Date :put =strftime('%A, %d %b %Y')

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

"coverage-highlight.vim
noremap [C :<C-U>PrevUncovered<CR>
noremap ]C :<C-U>NextUncovered<CR>

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
let mapleader = ' '

nnoremap Y y$
inoremap <Tab> <C-t>
inoremap <S-Tab> <C-d>
nnoremap yo# :ColorToggle<CR>
nnoremap yoa :ALEToggle<CR>
nnoremap yog :Goyo<CR>
nnoremap yoz zi

nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <leader>rf :RustFmt<cr>

"nnoremap <silent> <leader>a :ALEToggle<CR>
nnoremap <leader>b :Black<CR>
nnoremap <leader>c :ContextToggle<CR>
nnoremap <silent> <leader>f :FZF<CR>
"Like GitGutterRevertHunk
nnoremap <leader>hr <Plug>(GitGutterUndoHunk)
noremap <leader>rl :RainbowLevelsToggle<cr>
nnoremap <leader>n :NERDTreeToggleVCS<CR>
nnoremap <silent> <leader>rg :Rg <C-R><C-W><CR>
nnoremap <leader>t :TagbarToggle<CR>
let g:jedi#rename_command = "<leader>re"
let g:jedi#usages_command = "<leader>u"

"Check the highlight group under the cursor
map <leader><leader>h :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
