set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')
Plug 'gilgigilgil/anderson.vim'
Plug 'cocopon/iceberg.vim'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'hdima/python-syntax'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'stephpy/vim-yaml'
Plug 'morhetz/gruvbox'
Plug 'junegunn/seoul256.vim'
Plug 'majutsushi/tagbar'
Plug 'tssm/fairyfloss.vim'
Plug 'ryanoasis/vim-devicons'
call plug#end() 


colorscheme anderson
colorscheme iceberg 
let g:lightline = {
      \ 'colorscheme': 'iceberg',
      \ }

set number
set laststatus=2
set noshowmode
set noruler
set hlsearch

let g:limelight_default_coefficient = 0.8
let g:limelight_paragraph_span = 1
let g:goyo_width = 80

nnoremap <SPACE> <Nop>
let mapleader=" "
nmap <leader><Tab> :NERDTreeToggle<CR>
nmap <leader>l :Limelight<CR>
nmap <leader>y :Goyo<CR>
nmap <leader>b :TagbarToggle<CR>


augroup limelight.goyo.*
    autocmd!
    au BufEnter * Limelight
augroup END
