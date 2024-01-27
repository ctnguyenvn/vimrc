" Show tabbar
noremap <expr><silent> <leader>b &showtabline ? ":set showtabline=0\<CR>" : ":set showtabline=2\<CR>"

function s:showtabline()
    set showtabline=2
endfunction
autocmd VimEnter * call s:showtabline()

"nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
"nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

" Move to previous/next
nnoremap <silent>    <tab> :BufferNext<CR>
nnoremap <silent>    <s-tab> :BufferPrevious<CR>
" Re-order to previous/next
nnoremap <silent>    <S-n> :BufferMoveNext<CR>
nnoremap <silent>    <S-p> :BufferMovePrevious<CR>
" Goto buffer in position...
"nnoremap <silent>    <tab>1 :BufferGoto 1<CR>
"nnoremap <silent>    <tab>2 :BufferGoto 2<CR>
"nnoremap <silent>    <tab>3 :BufferGoto 3<CR>
"nnoremap <silent>    <tab>4 :BufferGoto 4<CR>
"nnoremap <silent>    <tab>5 :BufferGoto 5<CR>
"nnoremap <silent>    <tab>6 :BufferGoto 6<CR>
"nnoremap <silent>    <tab>7 :BufferGoto 7<CR>
"nnoremap <silent>    <tab>8 :BufferGoto 8<CR>
"nnoremap <silent>    <tab>9 :BufferGoto 9<CR>
"nnoremap <silent>    <tab>0 :BufferLast<CR>
" Pin/unpin buffer
"nnoremap <silent>    <tab>x :BufferPin<CR>
" Close buffer
nnoremap <silent>    <S-c> :BufferClose<CR>
" Wipeout buffer
"                          :BufferWipeout<CR>
" Close commands
"                          :BufferCloseAllButCurrent<CR>
"                          :BufferCloseAllButPinned<CR>
"                          :BufferCloseAllButCurrentOrPinned<CR>
"                          :BufferCloseBuffersLeft<CR>
"                          :BufferCloseBuffersRight<CR>
" Magic buffer-picking mode
nnoremap <silent> <S-f>    :BufferPick<CR>


"call bufferline#highlight#setup()
"lua require'bufferline.highlight'.setup()
