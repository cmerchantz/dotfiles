"Mappings
"--------
"Mappings are split into two sections for non-leader and leader mappings

"Non-leader mappings
"-------------------
"Have Y mimic the behavior of C and D
nnoremap Y y$

"Tab and shift-tab
inoremap <Tab> <C-t>
inoremap <S-Tab> <C-d>

"Have j and k act as gj and gk unless a count is supplied
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

"Split a line with S (analagous to J)
nnoremap S :keeppatterns substitute/\s*\%#\s*/\r/e <bar> normal! ==<CR>

"copy to clipboard
vnoremap <C-c> :w !pbcopy<CR><CR>

"Toggles
nnoremap yo# :ColorToggle<CR>
nnoremap yoa :ALEToggle<CR>
nnoremap yog :Goyo<CR>
nnoremap yoz zi

"Other
nnoremap <silent> gw :ArgWrap<CR>
nmap <silent> [a <Plug>(ale_previous_wrap)
nmap <silent> ]a <Plug>(ale_next_wrap)
"Jump to blocks of code missing test coverage (use after running
":HighlightCoverage)
noremap [C :<C-U>PrevUncovered<CR>
noremap ]C :<C-U>NextUncovered<CR>


"Leader mappings
"---------------
let mapleader = ' '

"Shorthand for :make!
nnoremap <leader>ma :make!<cr>

"For quick editing and sourcing the .vimrc file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"Toggle context folding at the top of the buffer
nnoremap <leader>c :ContextToggle<CR>

"Search in the current filetree using ripgrep
nnoremap <silent> <leader>rg :Rg <C-R><C-W><CR>

"Fuzzy search files
nnoremap <silent> <leader>f :FZF<CR>

"Define a command that basically mimics <leader>hu, like the bygone
"GitGutterRevertHunk
nnoremap <leader>hr <Plug>(GitGutterUndoHunk)

"Toggle highlighting that more clearly shows indentation
noremap <leader>rl :RainbowLevelsToggle<cr>

"Toggle a file browser
nnoremap <leader>n :NERDTreeToggleVCS<CR>

"Toggle a pane that shows a summary of the current file with tags
nnoremap <leader>t :TagbarToggle<CR>

"Some jedi mappings
let g:jedi#rename_command = "<leader>re"
let g:jedi#usages_command = "<leader>u"

"Check the highlight group under the cursor
map <leader><leader>h :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
