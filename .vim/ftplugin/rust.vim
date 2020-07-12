"Use cargo as the compiler
compiler cargo

"Look for this file when determining project roots
let g:gutentags_project_root = ['Cargo.toml']
call add(g:gutentags_project_info, {'type': 'rust', 'file': 'Cargo.toml'})

"Use 'cargo check' to debug rust projects and load errors into the quickfix
"list
set makeprg=cargo\ check\ $*

"Use RustFmt as the formatting command (which in turn points to
"g:rustfmt_command)
nnoremap <leader>gq :RustFmt<cr>

"Make shorthands for running rust files/projects
nnoremap <leader>rr :RustRun!<cr>
nnoremap <leader>cr :Cargo run<cr>
