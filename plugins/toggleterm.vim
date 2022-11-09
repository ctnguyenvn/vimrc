" nnoremap <C-t> :ToggleTerm<cr>

nnoremap <C-t> :ToggleTerm<cr>
tnoremap <Esc> <C-\><C-n><cr>

lua << EOF

require'toggleterm'.setup {
  -- shade_terminals = false
}

EOF
