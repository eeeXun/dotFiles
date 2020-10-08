set nocompatible
filetype off 

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'mbbill/undotree'
Plugin 'sheerun/vim-polyglot'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'stsewd/fzf-checkout.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tomtom/tcomment_vim'
Plugin 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }

"color
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'flazz/vim-colorschemes'
call vundle#end()

filetype plugin indent on

syntax on

set mouse=a
set guicursor=
set noshowmatch
set relativenumber
set nohlsearch
set hidden
set showcmd
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<ESC>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<ESC>[48;2;%lu;%lu;%lum"
endif

colorscheme gruvbox
set background=dark

"disable parenthesis highlighting
let loaded_matchparen = 1

let mapleader = " "

"normal
nnoremap Y y$
nnoremap <Leader>+ :resize +5<CR>
nnoremap <Leader>_ :resize -5<CR>
nnoremap <Leader>= :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <C-h> :bp<CR>
nnoremap <C-l> :bn<CR>
nnoremap <C-a> ggvG$
vnoremap <Tab> >gv=gv
vnoremap <S-Tab> <gv=gv
nnoremap <Leader>m :w<CR>

"terminal
tnoremap <C-\> <C-\><C-n>
nnoremap <Leader>`j :cd %:p:h<CR>:bel term<CR><C-w>:resize 10<CR>
nnoremap <Leader>`l :cd %:p:h<CR>:rightb vert term<CR>

"netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
nnoremap <Leader>pv :Vex<CR>
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) |Vex| endif

"airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let  g:airline_symbols.branch=''
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1

"windows_switch
nnoremap <Leader>h :wincmd h<CR>
nnoremap <Leader>j :wincmd j<CR>
nnoremap <Leader>k :wincmd k<CR>
nnoremap <Leader>l :wincmd l<CR>

"Undotree
nnoremap <Leader>u :UndotreeToggle<CR>

"fzf
nnoremap <Leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <Leader>phw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <Leader>ps :cd %:p:h<CR>:Rg<SPACE>
nnoremap <C-p> :cd %:p:h<CR>:GFiles<CR>
nnoremap <Leader>pf :cd %:p:h<CR>:Files<CR>
nnoremap <Leader>gs :G<CR>
let g:fzf_layout = { 'window': { 'width':0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

"fzf_checkout
nnoremap <Leader>gb :GCheckout<CR>

"polyglot
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1

"coc
nnoremap <Leader>cr :CocRestart<CR>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
nnoremap <Leader>gd :call CocAction('jumpDefinition', 'vsplit')<CR>
nnoremap <Leader>sh :CocSearch <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>rn <Plug>(coc-rename)

"bracket-pair
autocmd filetype cpp,c inoremap <buffer>{<CR> {<CR>}<ESC>O

"markdown_preview
let g:mkdp_browser = 'firefox'
let g:mkdp_refresh_slow = 1
let g:mkdp_auto_close = 0

nnoremap <F5> :call Execute_program()<CR>
func! Execute_program()
    if &filetype=='cpp'
        exec "w" | exec "!clear && g++ % -o %:r.exe && %:p:r.exe"
    elseif &filetype=='python'
        exec "w" | exec "!clear && python3 %"
    elseif &filetype=='html'
        exec "w" | exec "!firefox %"
    elseif &filetype=='markdown'
        exec "MarkdownPreview"
    endif
endfunc
