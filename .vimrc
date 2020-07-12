"Ye Olde Vim Configuration
"-------------------------
"The contents of this file are:
"    * Native Vim Settings
"    * Highlight Groups
"    * Plugin Installation
"    * Plugin Settings
"    * Custom Commands
"    * Source Mappings (located in .vim/mappings.vim)
"
" Filetype-specific settings are set in the .vim/ftplugin directory.

"Native Vim Settings
"-------------------
set nocompatible

syntax on
filetype on
colorscheme dim
set notermguicolors

set autoread
set autowrite
set relativenumber
set backspace=indent,eol,start
set hidden
set smarttab
set nojoinspaces
set nofoldenable
set ruler
set number
set hlsearch incsearch ignorecase smartcase
set cursorline
set splitright
set wildmenu
set updatetime=100
set nolist
set scrolloff=1
set sidescrolloff=1

"Define appearance of invisible characters
set showbreak=↪
set listchars=tab:——❩,nbsp:␣,trail:•,extends:᠁,precedes:᠁

"Clear the terminal on vim leave
set t_te=""
au VimLeave * :!clear

"Access a file that lets bash aliases be used in vim terminals
let $BASH_ENV="~/.vim/vim_bashrc"

"To find tags, look for a file called .tags and continue looking up the
"directory tree if we don't find it (until the home directory). This is also
"relevant to the gutentags configuration (see below).
set tags=./.tags;~

"By default, let tabs have the width of 4 spaces
set tabstop=4 softtabstop=4 shiftwidth=4

"The filetype-specific configuration exists in .vim/ftplugin files

"Highlight Groups
"----------------
"The highlighting commands are put in a function so that they can be
"re-applied when leaving Goyo
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
  hi ALEErrorSign ctermbg=NONE ctermfg=red
  hi ALEWarningSign ctermbg=NONE ctermfg=yellow
  hi! link GitGutterAdd DiffAdd
  hi! link GitGutterDelete DiffDelete
  hi! link GitGutterChange DiffChange
  hi GitGutterChangeDelete ctermbg=3 ctermfg=1 guibg=#bbbb00 guifg=#dd0000
  hi clear Conceal
  hi clear SignColumn

endfunction

call ApplyHighlighting()

"Plugin Installation
"-------------------
"Plugin management is done by vim-plug.

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
Plug 'junegunn/vim-after-object'
Plug 'jrudess/vim-foldtext'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'racer-rust/vim-racer', { 'for': 'rust' }
Plug 'rhysd/rust-doc.vim', { 'for': 'rust' }
call plug#end()

"Plugin Settings
"---------------
"The following blocks each relate to the specified plugin. There may also be
"mappings that relate to plugins in .vim/mappings

"junegunn/vim-after-object
autocmd VimEnter * call after_object#enable(['a', 'b'], '=', ':', '-', '#', ' ')

"vim-airline/vim-airline
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

"junegunn/fzf
let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --exclude .git --exclude __pycache__/'

"airblade/vim-gitgutter
let g:gitgutter_async = 0
let g:gitgutter_sign_added = '\ +'
let g:gitgutter_sign_modified = '\ ~'
let g:gitgutter_sign_removed = '\ −'
let g:gitgutter_sign_removed_first_line = '\ −'
let g:gitgutter_sign_modified_removed = '\ ~'

"tpope/vim-fugitive
autocmd FileType gitcommit set foldmethod=syntax

"severin-lemaignan/vim-minimap
let g:minimap_highlight = 'SearchCurrent'

"majutsushi/tagbar
let g:tagbar_sort = 0

"ervandew/supertab
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = '<c-x><c-o>'
let g:SuperTabClosePreviewOnPopupClose = 1

"psf/black
let g:black_linelength = 100

"FooSoft/vim-argwrap
let g:argwrap_tail_comma = 1

"davidhalter/jedi-vim
let g:jedi#use_splits_not_buffers = 'left'
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = '2'
let g:jedi#goto_stubs_command = ""

"tmhedberg/SimpylFold
let g:SimpylFold_docstring_preview = 1

"wellle/context.vim
let g:context_enabled = 0

"ludovicchabant/vim-gutentags
let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_file_list_command = 'rg --files'
let g:gutentags_project_root = ['.root']
let g:gutentags_generate_on_missing=1
let g:gutentags_generate_on_write=1
let g:gutentags_background_update=1
let g:gutentags_ctags_executable_rust = '$HOME/.vim/gutentags-rust.sh'

"thiagoalessio/rainbow_levels.vim
"Make two functions with different sets of highlighting options that are
"particular to this plugin
function! RainbowLevelsColors()

	hi! RainbowLevel0 ctermfg=068 guifg=#6699cc
	hi! RainbowLevel1 ctermfg=203 guifg=#ec5f67
	hi! RainbowLevel2 ctermfg=221 guifg=#fac863
	hi! RainbowLevel3 ctermfg=114 guifg=#99c794
	hi! RainbowLevel4 ctermfg=176 guifg=#c594c5
	hi! RainbowLevel5 ctermfg=209 guifg=#f99157
	hi! RainbowLevel6 ctermfg=073 guifg=#62b3b2
	hi! RainbowLevel7 ctermfg=137 guifg=#ab7967

endfunction

"This set of highlights preserves syntax highlighting, just color background

function! RainbowLevelsBW()

  hi! RainbowLevel0 ctermbg=240 guibg=#585858
  hi! RainbowLevel1 ctermbg=239 guibg=#4e4e4e
  hi! RainbowLevel2 ctermbg=238 guibg=#444444
  hi! RainbowLevel3 ctermbg=237 guibg=#3a3a3a
  hi! RainbowLevel4 ctermbg=236 guibg=#303030
  hi! RainbowLevel5 ctermbg=235 guibg=#262626
  hi! RainbowLevel6 ctermbg=234 guibg=#1c1c1c
  hi! RainbowLevel7 ctermbg=233 guibg=#121212

endfunction

"Use the colored foreground one by default
call RainbowLevelsColors()

"junegunn/limelight.vim
let g:limelight_conceal_ctermfg = 240

"junegunn/goyo.vim
let g:goyo_width = '80%'
let g:goyo_height = '85%'

"Define two functions that handle entering and exiting Goyo (mostly for
"Limelight integration)
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

"dense-analysis/ale
let g:ale_enabled = 1
let g:ale_linters = {
	\ 'python': ['flake8'],
	\ 'rust': ['rls', 'cargo', 'analyzer'],
\ }
let g:ale_rust_rls_config = {
	\ 'rust': {
	\	'clippy_preference': 'on'
	\ }
\ }
let g:ale_fixers = {'rust': ['rustfmt']}
let g:ale_python_flake8_options = '--max-line-length=100'
let g:ale_virtualenv_dir_names = []
let g:ale_sign_error = '⛔️'
let g:ale_sign_warning = '⚠️'

"Use rustup setting for each rust project
let g:ale_rust_rls_toolchain = ''

"lervag/vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='skim'
let g:vimtex_quickfix_mode=0
let g:vimtex_indent_enabled=0
set conceallevel=1

"KeitaNakamura/tex-conceal.vim
let g:tex_conceal='abdmg'

"SirVer/ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"honza/vim-snippets
"Use numpy-style docstrings
let g:ultisnips_python_style = 'numpy'
"Prefer the use of double quotes, which matches black's preferred quoting style
let g:ultisnips_python_quoting_style = 'double'

"racer-rust/vim-racer
let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1

"Custom Commands
"---------------
" Make a line have 'title case'
command TitleCase :s/\v<(.)(\w*)/\u\1\L\2/g

"fugitive-esque git diff --staged
command! Greview :Gtabedit @:% | Gdiff :

"Insert the current date
command! Date :put =strftime('%A, %d %b %Y')

"Open a new buffer from search matches
command! -nargs=? Filter let @a='' | execute 'g/<args>/y A' | new | setlocal bt=nofile | put! a

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

"Source Mappings
"---------------
source ~/.vim/mappings.vim
