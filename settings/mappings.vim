
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Leader mapping key
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "

" Fast saving
nmap <leader>s :w!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => resize && switch and move
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" resize current window size
noremap <silent> <C-l> :vertical resize +3<CR>
noremap <silent> <C-h> :vertical resize -3<CR>
noremap <silent> <C-j> :resize +3<CR>
noremap <silent> <C-k> :resize -3<CR>

" switch other window
nnoremap <silent> <leader>h :wincmd h<CR>
nnoremap <silent> <leader>j :wincmd j<CR>
nnoremap <silent> <leader>k :wincmd k<CR>
nnoremap <silent> <leader>l :wincmd l<CR>

" Fast move over line
nnoremap <silent> <S-j> :+7<CR>
nnoremap <silent> <S-k> :-7<CR>

" Swap line
nnoremap <silent> <C-n> :m+1<CR>
nnoremap <silent> <C-u> :m-2<CR>

" Duplicate line
nnoremap <silent> <C-d> yypk<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tabline color function
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function s:HideTabline()
    set showtabline=0
endfunction
autocmd VimEnter * call s:HideTabline()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => run project with makefile
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F5> :split term://make run <CR>
nnoremap <silent> <leader>t :split term:///bin/bash <CR>
