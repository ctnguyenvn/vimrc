
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 	Load General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
for f in split(glob('~/.config/nvim/settings/*.vim'), '\n')
   exe 'source' f
endfor


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 	List of plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/bundle')

" Color Themes 
Plug 'morhetz/gruvbox'

" Git status
Plug 'tpope/vim-fugitive'

" Status line
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" A neovim lua plugin to help easily manage multiple terminal windows
" Plug 'akinsho/toggleterm.nvim', tag = 'v1.*'

" Find, Filter, Preview, Pick. All lua, all the time
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Simple statusline component that shows what scope you are working inside 
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'SmiteshP/nvim-gps'

" A file explorer tree for neovim written in lua 
Plug 'kyazdani42/nvim-tree.lua'

" The neovim tabline plugin
Plug 'romgrk/barbar.nvim'

" Autopairs for neovim written by lua 
" Plug 'windwp/nvim-autopairs'

" Smart and Powerful commenting plugin for neovim
Plug 'numToStr/Comment.nvim'

" Quickstart configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

" A completion engine plugin for neovim written in Lua
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" Plugin for formatting code. 
Plug 'sbdchd/neoformat'

" A small automated session manager for Neovim 
Plug 'rmagatti/auto-session'

call plug#end()



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 	Load config plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
for f in split(glob('~/.config/nvim/plugins/*.vim'), '\n')
   exe 'source' f
endfor


