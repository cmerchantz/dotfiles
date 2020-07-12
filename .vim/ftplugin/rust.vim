"Look for this file when determining project roots
let g:gutentags_project_root = ['Cargo.toml']
call add(g:gutentags_project_info, {'type': 'rust', 'file': 'Cargo.toml'})

"Use 'cargo run' to run rust files
set makeprg=cargo\ run

"Use RustFmt as the formatting command (which in turn points to
"g:rustfmt_command)
nnoremap <leader>gq :RustFmt<cr>
