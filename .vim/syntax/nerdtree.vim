"Change the highlighting for the current line only for nerdree files
hi CursorLine ctermbg=white ctermfg=darkgreen cterm=bold
au BufLeave <buffer> call ApplyHighlighting()
