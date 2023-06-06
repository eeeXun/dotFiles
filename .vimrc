if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plug
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
call plug#end()

" settings
set number
set relativenumber
set nowrap
set noswapfile
set colorcolumn=80
let loaded_matchparen=1
let &scrolloff=float2nr(&lines*0.25)

" color
set termguicolors
set background=dark
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
highlight ColorColumn ctermbg=0 guibg=lightgrey

" tab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

" map
let mapleader = " "
nnoremap Y y$
inoremap <C-c> <Esc>
nnoremap r<C-c> <Esc>
nnoremap ZA :quitall<CR>
nnoremap <Leader>m :write<CR>
nnoremap <Leader>+ :resize +5<CR>
nnoremap <Leader>_ :resize -5<CR>
nnoremap <Leader>= :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
vnoremap J :move '>+1<CR>gv=gv
vnoremap K :move '<-2<CR>gv=gv
nnoremap <Leader>a ggvG$
vnoremap <Tab> >gv=gv
vnoremap <S-Tab> <gv=gv

" window
nnoremap <Leader>h :wincmd h<CR>
nnoremap <Leader>j :wincmd j<CR>
nnoremap <Leader>k :wincmd k<CR>
nnoremap <Leader>l :wincmd l<CR>

" fugitive
nnoremap <Leader>gs :Git<CR>
nnoremap <Leader>cm :Gclog<CR>
nnoremap <Leader>dg :diffget<CR>
nnoremap <Leader>dh :diffget //2<CR>
nnoremap <Leader>dl :diffget //3<CR>

" fzf
if has('patch-8.2.191')
  let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
endif
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_preview_window = ['right:60%', 'ctrl-/']
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>bb :Buffers<CR>
nnoremap <Leader>gb :GBranches<CR>
nnoremap <Leader>ff :Files %:p:h<CR>

" last-position-jump
autocmd BufReadPost *
      \ if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif
