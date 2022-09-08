
" User interface options
set history=500     " Set history line number in command execute
set number          " Show line numbers on the sidebar
set mouse=a         " Enable mouse for scrolling and resizing

set autoread        " Auto read whent a file if changed from the outside  
set splitbelow      " Split window below 
set cursorline      " Highlight the current line under cursor

filetype indent on  " Enable indentation rules that are file-type specific
syntax enable       " Enable syntax highlighting


" Search options
set smartcase       " When searching try to be smart about cases
set ignorecase      " Ignore case when searching
set incsearch       " Incrementalsearch that shows partial matches

" Performance options
set lazyredraw      " Don't update screen during macro and script execution 

" Backup options
set nobackup        " 
set nowritebackup   " 
set noswapfile      " Disable swap files

" Indention options
set linebreak       " Enable line break
set tw=500          " Number of character to break line
set autoindent      " New lines inherit the indentation of previous lines
set smartindent     " Smart indent with code edit
"set wrap            " Enable wrap line

"set expandtab       " Convert tabs to spaces
set smarttab        " Insert “tabstop” number of spaces when the “tab” key is pressed
set shiftwidth=4    " When shifting, indent using four spaces
set tabstop=4       " Indent using four spaces

