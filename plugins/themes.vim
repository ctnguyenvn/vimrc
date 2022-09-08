" Important!!
if has('termguicolors')
	set termguicolors
endif

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_bold = 0
let g:gruvbox_italic = 1
let g:gruvbox_transparent_bg = 1
let g:gruvbox_invert_signs = 1
let g:gruvbox_invert_selection = 0
let g:gruvbox_termcolors = 16
let g:gruvbox_guisp_fallback = 'fg'

autocmd vimenter * ++nested colorscheme gruvbox

function s:SetCursorLine()
    set cursorline
    hi cursorline cterm=none ctermbg=darkblue ctermfg=white
endfunction
autocmd VimEnter * call s:SetCursorLine()

