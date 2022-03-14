" No vi compatibility
set nocompatible

" Line numbers
set number
set relativenumber

" Formating
set fileformat=unix
set encoding=utf-8

set autoindent
set tabstop=2
set shiftwidth=2
set noexpandtab

" Formating
set ruler
set nowrap

" Backuping
set noswapfile
set nobackup
set noundofile

" Syntax
syntax on

" Mapping
map x "_dl
vmap X "_d

" Highlighting
set nohlsearch
set incsearch

" Color scheme
colorscheme gruvbox

" Mouse
set mouse=a
set novisualbell

" System clipboard
set clipboard=unamedplus

" Autocompletion
set wildmode=full


" Split windows
set splitbelow splitright

" Replacement
nnoremap S :%s///g<Left><Left><Left>
xnoremap s :s///g<Left><Left><Left>

" Tabs
nnoremap <C-w>n :tabnew<CR>
nnoremap <C-w>c :tabclose<CR>

" Cursor
set guicursor=

" Emulated shell &| Windows
set noerrorbells

" Scrolling
set scrolloff=2

" Creating Adjecent windows
map <C-w>w <C-w>v

" Quit Alternative
map Q :q<CR>
map <leader>Q :q!<CR>

" Esc Alternative
inoremap <C-c> <ESC>
nnoremap <C-[> <ESC>
xnoremap <C-[> <ESC>

" Find Alternative
map <C-f> /

" Find Only in visual area
map <leader><C-s>v /\%V

" Find From Register
nnoremap <leader>r yy/<C-r>"<CR>
xnoremap <leader>r yy/<C-r>"
vnoremap <leader>v y/\V<C-R>=escape(@",'/\')<CR><CR>

" Line Number Alternative
map <C-n> :

" Saving Alternative
map W :w<CR>

" Highlight color fix
set bg=dark

" Highlight line
set cursorline

" Remap Leader
let mapleader = "\\"

" Left Column
set signcolumn=yes
set cursorcolumn

" Plugins (plug-vim)
call plug#begin()
" Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ap/vim-css-color'
Plug 'tpope/vim-surround'
Plug 'pseewald/vim-anyfold'
Plug 'matze/vim-move'
Plug 'ryanoasis/vim-devicons'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf'
Plug 'wellle/context.vim'
Plug 'vimwiki/vimwiki'
Plug 'mhinz/vim-startify'
Plug 'itchyny/lightline.vim'
" Plug 'morhetz/gruvbox'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'gruvbox-community/gruvbox'
call plug#end()

" nerdtree
nnoremap <leader>n :NERDTreeToggle<CR>

" anyfold
map <leader>a :AnyFoldActivate<CR>

" context
let g:context_enabled = 0

" File nnoremaps
nnoremap <leader>w :e#<CR>
nnoremap <leader>o :e <Tab>
nnoremap <leader><C-o> :e 
nnoremap <leader>x :e **/*<Tab>
nnoremap <leader><C-x> :e **/*
nnoremap <leader><C-s>f :FZF<CR>

" Dirty Hack
set wildcharm=<Tab>

" Terminal nnoremaps
nnoremap <leader><C-f>t :vert term<CR>

" Search Highlighting nnoremap
let hlstate=0
nnoremap <silent> <C-s> :if (hlstate == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=1-hlstate<cr>


" Grepping
nnoremap <leader>g :vimgrep // **<left><left><left><left>
map g, :cp<CR>
map g. :cn<CR>

" Diffing
nnoremap <leader>d :vert diffsplit **<Tab>
nnoremap <leader><C-d> :vert diffsplit 

" Get Current Working Directory
nnoremap <leader>p :pwd<CR>

" Show number of lines & such
set showcmd

" Folding
set foldlevel=92 " otherwise everything is folded by default
map <C-t>o :foldopen<CR>
map <C-t>c :foldclose<CR>

" List Chars config
set list
set listchars=tab:\¦\ ,trail:·,extends:…,precedes:…
hi SpecialKey ctermfg=240 guifg=#585858
" ^^ change this if `colorscheme` changes

" Other alternatives
map <leader><C-s>g g<C-g>
nnoremap <C-p> <C-y>
xnoremap <C-p> <C-y>
inoremap <C-k> <C-x><C-f>

" SD syntax load
au BufRead,BufNewFile *\.sd  set filetype=sdlang

" cursor
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"

" tab suggestions
set wildmenu

" completion
inoremap <expr> <Tab> TabComplete()
fun! TabComplete()
    if getline('.')[col('.') - 2] =~ '\K' || pumvisible()
        return "\<C-N>"
    else
        return "\<Tab>"
    endif
endfun

" Minimalist-AutoCompletePop-Plugin
set shortmess-=S
set shortmess+=at
set ignorecase
map <leader>i :set ignorecase!<CR>
set completeopt=menu,menuone,noinsert
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

" highlight word without searching
nnoremap <silent><leader><cr> :let searchTerm = '\v<'.expand("<cword>").'>' <bar> let @/ = searchTerm <bar> echo '/'.@/ <bar> call histadd("search", searchTerm) <bar> set hls<cr>
xnoremap <silent><leader><cr> yy:<C-u>let searchTerm = '\V'.substitute(escape(@", '\/'), "\n", '\\n', "g") <bar> let @/ = searchTerm <bar> call histadd("search", searchTerm) <bar> set hls <CR>

" grep visual
xnoremap <leader><C-e>g y:vimgrep /<C-r>"/ **


" from the 'do 90% of what plugins do just with vim'
set path=**
nnoremap <leader>f :find *
set noshowmode

" netrw fix
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" wrap fix
nnoremap <leader><C-s>w :set wrap!<CR>

" rotate fix
nnoremap <Space>h <C-w>h
nnoremap <Space>j <C-w>j
nnoremap <Space>k <C-w>k
nnoremap <Space>l <C-w>l

" grep fix
augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l* lwindow
augroup END

" completion fix
nnoremap <leader>W :set complete+=k**<CR>
set complete=.

" last command
nnoremap <leader><C-u>j :<Up>
nnoremap <leader><C-u>k /<Up>

" g-hacks
nnoremap <leader><C-j> gj
nnoremap <leader><C-k> gk

" replace on visual select
xnoremap <leader>s :s///g<left><left><left>

" horizontal scroll
set sidescroll=2
nnoremap <leader>0 g0
nnoremap <leader>$ g$

nnoremap <C-t><C-h> :tabprevious<CR>
nnoremap <C-t><C-l> :tabnext<CR>

nnoremap <leader>h zH
nnoremap <leader>l zL

" bar
set colorcolumn=100

" add new line
nnoremap K s<CR><ESC>
xnoremap K s<CR><ESC>
nnoremap <leader>K i<CR><ESC>
xnoremap <leader>K i<CR><ESC>

" rainbow
au FileType c,cpp,python,sh,rust,javascript,json call rainbow#load()

" case insensitive search
set wildignorecase
set wildignore+=*.o,*.a,*.so,tags,Makefile

" tabs moving
nnoremap <C-t>h :-tabmove<CR>
nnoremap <C-t>l :+tabmove<CR>

" vimwiki config
let g:vimwiki_list = [{'path':'/home/mh/Wiki/', 'syntax': 'markdown', 'ext': 'md'}]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_markdown_link_ext = 1

" vimwiki compatibility
filetype plugin on

let g:startify_custom_header = [
	\ '\------------------------------------------\' ,
	\ '|       H  H   https://twitch.tv/mhhmr     |' ,
	\ '|       H  H                               |' ,
	\ '| mmmm  HHHH                               |' ,
	\ '| m m m H  H                               |' ,
	\ '| m m m H  H   https://github.com/matthmr  |' ,
	\ '\------------------------------------------\' ,
	\ ]

" update time
let updatetime=2000 " updates each 2 seconds

" reload .vimrc
nnoremap <leader>r :source /home/mh/.vimrc

" buffer loading
nnoremap <leader><C-S>b :buffers<CR>:buffer 

" templates
nnoremap <leader><C-s>tj :read /home/mh/.vim/templates/journal.template<CR>5k0$

" quit all
nnoremap <leader>qa :qall<CR>

" read from file
nnoremap <leader><C-s>l :read 

" marks
nnoremap <leader><C-s>m :marks<CR>

" tmux mouse fix
set ttymouse=xterm2

" registers
nnoremap <leader><C-s>r :registers<CR>

" Y remap
nnoremap Y y$

" Paste fix
nnoremap <leader><C-s>p :set paste!<CR>

" Weird-replace-mode-on-enter fix
nnoremap <esc>^[ <esc>^[

" Lightline
set laststatus=2

let g:lightline = {
      \ 'component': { 'lineinfo': "%{line('.') . '/' . line('$') . ':' . col('.')}", },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ],
      \   'right': [['lineinfo'], ['percent'], ['filetype', 'fileencoding', 'fileformat']],
      \ },
      \ 'tabline': {
      \   'left': [ ['tabs'] ],
      \   'right': [ ['close'] ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \ }

" vim-move
let g:move_key_modifier = 'C'

" saving
nnoremap <leader><C-s>u :earlier 1f<CR>

" global marks
set viminfo-=f0
nnoremap <leader><C-r>d :delmarks<CR>

" set autoread
nnoremap <leader><C-r>e :e!<CR>

" resize
nnoremap <leader>vp :vert resize +10<CR>
nnoremap <leader>vm :vert resize -10<CR>
nnoremap <leader>hp :resize +10<CR>
nnoremap <leader>hm :resize -10<CR>

" gruvbox fix?
let g:gruvbox_contrast_dark = 'hard'

" fold fix
" set foldmethod=manual
set foldmethod=syntax

" set only
nnoremap <leader><C-s>o :only!<CR>

" alacrity fix
hi Normal guibg=NONE ctermbg=NONE

" shortmess fix
command! -nargs=+ Silent
\   execute 'silent <args>'
\ | redraw!
nnoremap <leader><C-r>s :!

" make wrapper
nnoremap <leader><C-r>c :make 
nnoremap <leader><C-r>t :term<CR>

" omnifunc
filetype plugin on
set omnifunc=syntaxComplete#Complete
inoremap <C-o> <C-x><C-o>

" terminal
tnoremap <C-[> <C-\><C-n>

" visual mode pasting
xnoremap <expr> p 'pgv"'.v:register.'y`>'
xnoremap <expr> P 'Pgv"'.v:register.'y`>'
