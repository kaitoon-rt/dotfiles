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
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'davidhalter/jedi-vim'
Plug 'terryma/vim-expand-region'
Plug 'machakann/vim-highlightedyank'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'kien/rainbow_parentheses.vim'
Plug 'kshenoy/vim-signature'
Plug 'yuttie/comfortable-motion.vim'
call plug#end() 


colorscheme anderson
colorscheme iceberg 
let g:lightline = {
      \ 'colorscheme': 'iceberg',
      \ }

set number
set relativenumber
set laststatus=2
set noshowmode
set noruler
set hlsearch
set splitbelow
set showtabline=2
set showcmd

let g:limelight_default_coefficient = 0.8
let g:limelight_paragraph_span = 1
let g:goyo_width = 80
let g:goyo_linenr = 1
let g:highlightedyank_highlight_duration = -1
let g:expand_region_text_objects = {
      \ 'iw'  :1,
      \ 'iW'  :1,
      \ 'i"'  :1,
      \ 'i''' :1,
      \ 'i]'  :1, 
      \ 'ib'  :1,
      \ 'iB'  :1,
      \ 'il'  :0,
      \ 'ip'  :1,
      \ 'ie'  :0,
      \ }

nnoremap <SPACE> <Nop>
let mapleader=" "
nmap <silent> <leader>i :split<CR>
nmap <silent> <leader>k :split<CR>
nmap <silent> <leader>j :vertical split<CR>
nmap <silent> <leader>l :vertical split<CR>
nmap <silent> <leader>I :wincmd k<CR>
nmap <silent> <leader>K :wincmd j<CR>
nmap <silent> <leader>J :wincmd h<CR>
nmap <silent> <leader>L :wincmd l<CR>

nmap h <insert>
nmap i <Up>
nmap I <PageUp>
nmap j <Left>
nmap J :tabprevious<CR>
nmap k <Down>
nmap K <PageDown>
nmap L :tabnext<CR>

nmap <silent> <C-i> :res +1<CR>
nmap <silent> <C-j> :vertical resize -1<CR>
nmap <silent> <C-k> :res -1<CR>
nmap <silent> <C-l> :vertical resize +1<CR>

nmap <silent> <leader><Tab> :TagbarOpen cfj<CR>
nmap <silent> <leader>l :Limelight<CR>
nmap <silent> <leader>G :Goyo<CR>
map <silent> / :Commentary<cr>
map <leader>w <Plug>(expand_region_expand)

map <leader><leader><leader><leader> <Plug>(easymotion-prefix)
nmap <leader>f <Plug>(easymotion-overwin-f2)

let g:comfortable_motion_no_default_key_mappings = 1
nnoremap <silent> <PageUp> :call comfortable_motion#flick(-150)<CR>
nnoremap <silent> <PageDown> :call comfortable_motion#flick(150)<CR>

nnoremap <silent> <C-f> :BLines<CR>
nnoremap <silent> <leader>o :Files<CR>
nnoremap <silent> <leader>O :Files ~<CR>
nnoremap <silent> <leader>t :Buffers<CR>
nnoremap <silent> <leader>g :Marks<CR>

nnoremap <silent> <leader>C :%y<CR>

nnoremap <silent> <C-t> :tabe<CR>
" nnoremap <silent> <C-w> :tabclose<CR>
nnoremap <silent> <leader>1 1gt
nnoremap <silent> <leader>2 2gt
nnoremap <silent> <leader>3 3gt
nnoremap <silent> <leader>4 4gt
nnoremap <silent> <leader>5 5gt
nnoremap <silent> <leader>6 6gt
nnoremap <silent> <leader>7 7gt
nnoremap <silent> <leader>8 8gt
nnoremap <silent> <leader>9 9gt
nnoremap <silent> <leader>0 0gt
nnoremap <silent> <leader><Left> :tabprevious<CR>
nnoremap <silent> <leader><Right> :tabnext<CR>
nnoremap <silent> <leader>! :qa!<CR>

imap jj @!
inoremap gjj <ESC>?@!<CR>2s
imap <C-z> <ESC>ua
imap <C-f> <ESC><leader>f

""" :q quits even when in Goyo
function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()
"""

""" no file name when searching
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
"""

""" Auto close preview windows
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"""

""" yank to windows
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif
"""

""" Auto Limelight
augroup limelight.goyo.*
    autocmd!
    au BufEnter * Limelight
augroup END
"""

""" Rainbow Parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
au Syntax * RainbowParenthesesLoadChevrons
"""

