"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim config file simple by ctnguyenvn
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500
set number
set mouse=a

" Enable filetype plugins
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Set split below
set splitbelow

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ";"

" Fast saving
nmap <leader>s :w!<cr>

" Tagbar plugin
nmap <F3> :TagbarToggle<cr>

" Open terminal
map <leader>t :terminal<CR>
nmap <leader>T :botright terminal<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" eable &&  set UndoTree folder
set undodir=~/.vim/undodir
set undofile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Add vundle plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible 
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"Vim plugin for intensely nerdy commenting powers
Plugin 'scrooloose/nerdtree'

"Vim plugin that displays tags in a window, ordered by scope
Plugin 'majutsushi/tagbar'

"lean & mean status/tabline for vim that's light as air
Plugin 'vim-airline/vim-airline' 

"Vim plugin which shows git diff markers in the sign column
Plugin 'tpope/vim-fugitive'

"Retro groove color scheme for Vim
Plugin 'morhetz/gruvbox'

"Retro groove color scheme for Vim
Plugin 'scrooloose/syntastic'

"Go development plugin for Vim
Plugin 'fatih/vim-go'

" A code-completion engine for Vim
Plugin 'valloric/youcompleteme'

" undotree plugin
Plugin 'mbbill/undotree'

" Icon
Plugin 'ryanoasis/vim-devicons'

" emmet for vim: http://emmet.io/
"Plugin 'mattn/emmet-vim'

" A command-line fuzzy finder
" Plugin 'junegunn/fzf'

" Plugin 'honza/vim-snippets' " vim-snipmate default snippets (Previously snipmate-snippets)
" Plugin 'terryma/vim-multiple-cursors' "  True Sublime Text style multiple selections for Vim

call vundle#end()
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
"set ruler

" Height of the command bar
"set cmdheight=1

" A buffer becomes hidden when it is abandoned
"set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
"set smartcase

" Highlight search results
"set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
"set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" Add a bit extra margin to the left
set foldcolumn=1

" resize current window size
noremap <silent> <C-S-l> :vertical resize +3<CR>
noremap <silent> <C-S-h> :vertical resize -3<CR>
noremap <silent> <C-S-j> :resize +3<CR>
noremap <silent> <C-S-k> :resize -3<CR>

" switch other window
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 

"colorscheme ron

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => gruvbox theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi PmenuSel     ctermfg=NONE ctermbg=NONE
"set background=dark    " Setting dark mode
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Delete trailing white space on save, useful for some filetypes
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Buffers & buffer using tab & cursorline color function
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
noremap <expr><silent> <leader>b &showtabline ? ":set showtabline=0\<CR>" : ":set showtabline=2\<CR>"
nnoremap <Leader>q :Bclose<CR>

function s:SetCursorLine()
    set cursorline
    hi cursorlineNr cterm=none ctermbg=235 ctermfg=none
endfunction
autocmd VimEnter * call s:SetCursorLine()

function s:HideTabline()
    set showtabline=0
endfunction
"autocmd VimEnter * call s:HideTabline()

let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 0
let g:airline#extensions#hunks#hunk_symbols = ["\uf0fe:", "\uf14c:", "\uf146:"]

let g:airline#extensions#tabline#enabled = 1

" enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Always show tabs
set showtabline=2

let colorterm=$COLORTERM
if colorterm=="truecolor" || colorterm=="24bit"
  let g:airline_left_sep = "\uE0B4"
  let g:airline_right_sep = "\uE0B6"
else
  let g:airline_left_sep = "\u205E"
  let g:airline_right_sep = "\u205E"
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YouCompleteMe plugin config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" turn off preview window
set completeopt-=preview
set completeopt+=popup
"let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_autoclose_preview_window_after_completion = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-go plugin config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree plugin config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree plugin
nmap <F2> :NERDTreeToggle<CR>
function! StartUp()
    if !argc() && !exists("s:std_in")
        NERDTree
    end
    if argc() && isdirectory(argv()[0]) && !exists("s:std_in")
        exe 'NERDTree' argv()[0]
        wincmd p
        ene
    end
endfunction

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * call StartUp()
autocmd BufWritePost * NERDTreeFocus | execute 'normal R' | wincmd p

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UndoTree  plugin config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>u :UndotreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
