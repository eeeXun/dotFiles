call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'tpope/vim-fugitive'
Plug 'tomtom/tcomment_vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }

"color
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
call plug#end()

syntax on

" set mouse=a
noremap <Up> <nop>
noremap <Down> <nop>
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
set undodir=~/.config/nvim/undodir
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
    let &t_8f = '\<ESC>[38;2;%lu;%lu;%lum'
    let &t_8b = '\<ESC>[48;2;%lu;%lu;%lum'
endif

colorscheme gruvbox
set background=dark

"disable parenthesis highlighting
let loaded_matchparen = 1

let mapleader = ' '

"normal
inoremap <C-c> <ESC>
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
nnoremap <C-a> gg0vG$
vnoremap <Tab> >gv=gv
vnoremap <S-Tab> <gv=gv
nnoremap <Leader>m :w<CR>
nnoremap <Leader>phw :h <C-R>=expand("<cword>")<CR><CR>

"terminal
tnoremap <C-\> <C-\><C-n>
nnoremap <Leader>`j :cd %:p:h<CR>:bel 10sp<CR>:term<CR>
nnoremap <Leader>`l :cd %:p:h<CR>:bel vsp<CR>:term<CR>

"NERDTree
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>pv :cd %:p:h<CR>:NERDTreeCWD<CR>
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeMinimalUI=1
autocmd VimEnter * if argc() == 0 |NERDTree| endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv(0)) |bd|exec 'NERDTree '.argv(0)| endif

"airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.branch=''
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#tabline#ignore_bufadd_pat = '!|undotree'

"windows_switch
nnoremap <Leader>h :wincmd h<CR>
nnoremap <Leader>j :wincmd j<CR>
nnoremap <Leader>k :wincmd k<CR>
nnoremap <Leader>l :wincmd l<CR>

"Undotree
let g:undotree_HelpLine=0
nnoremap <Leader>u :UndotreeToggle<CR>

"fzf
nnoremap <Leader>pw :cd %:p:h<CR>:Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <Leader>ps :cd %:p:h<CR>:Rg<SPACE>
nnoremap <C-p> :cd %:p:h<CR>:GFiles<CR>
nnoremap <Leader>pf :cd %:p:h<CR>:Files<CR>
nnoremap <Leader>gs :G<CR>
nnoremap <Leader>gh :diffget //2<CR>
nnoremap <Leader>gl :diffget //3<CR>
let g:fzf_layout = { 'window': { 'width':0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

"fzf_checkout
nnoremap <Leader>gb :GBranches<CR>

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
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
imap <expr><C-j> pumvisible() ? "\<C-y>" : "\<C-j>"
nnoremap <Leader>gd :call CocAction('jumpDefinition', 'vsplit')<CR>
nnoremap <Leader>sh :CocSearch <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>rn <Plug>(coc-rename)
let g:coc_filetype_map={'htmldjango': 'html'}

"tcomment
let g:tcomment_maps=0
noremap <silent><C-_><C-_> :TComment<CR>

"markdown_preview
let g:mkdp_browser = 'firefox'
let g:mkdp_refresh_slow = 1
let g:mkdp_auto_close = 0

"bracket-pair
autocmd filetype cpp,c,sh,javascript inoremap <buffer>{<CR> {<CR>}<ESC>O

nnoremap <F5> :call Execute_program()<CR>
function! Execute_program()
    if &filetype=='cpp'
        exec 'w' | exec '!g++ % -o /tmp/a.out && /tmp/a.out'
    elseif &filetype=='python'
        exec 'w' | exec '!python3 %'
    elseif &filetype=='html'
        exec 'w' | exec 'silent !firefox % &'
    elseif &filetype=='markdown'
        exec 'MarkdownPreview'
    endif
endfunction
