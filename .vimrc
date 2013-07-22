set nocp
call pathogen#infect()
syntax on
filetype plugin indent on
syntax sync minlines=256

" Appearance {{{
set background=dark
colorscheme solarized
highlight SignColumn guibg=black
" }}}

" Abbreviations {{{

" Insert mode
iabbrev serach search

" }}}

" All Settings {{{

" Spacing {{{
set modelines=0
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set bs=2
" }}}

" Search highlighting {{{
set hls
set is
" }}}

" Misc settings {{{
set tildeop
set nocursorcolumn
set nocursorline
set encoding=utf-8
set scrolloff=3
set showcmd
set wildmenu
set wildmode=list:longest
set ttyfast
set ruler
set laststatus=2
set relativenumber
set undofile
set ignorecase
set smartcase
set gdefault
set showmatch

" Disable search in folds
set foldopen-=search
" }}}

" }}}


" Bindings {{{

" Leaders
let mapleader = ","
let maplocalleader = "\\"

" Insert Mode bindings {{{

" }}}

" Normal Mode bindings {{{

" Lose highlighting
nnoremap <Leader>u :noh<CR>

" Move on screen lines, not file lines
nnoremap j gj
nnoremap k gk

" Open vimrc in horizontal split
nnoremap <leader>ev :split $MYVIMRC<cr>

" NERDTree bindings
nnoremap <leader>n :NERDTreeToggle<cr>

" }}}

" Visual Mode Bindings {{{

" Run selection through xmllint format
vnoremap <leader>f :!xmllint --format -<CR>

" }}}

" Misc bindings {{{

" Regex fixes
nnoremap / /\v
vnoremap / /\v

" Markdown Headers (e.g. markdown)
nnoremap <Leader>h yyp<c-v>$r-
nnoremap <Leader>H yyp<c-v>$r=
inoremap <c-h> <esc>yyp<c-v>$r-A
inoremap <c-H> <esc>yyp<c-v>$r=A

" }}}

" }}}


" Plugin Settings {{{

" Eclim
let g:EclimXmlValidate = 0

" Vimclojure {{{
let vimclojure#FuzzyIndent=1
let vimclojure#HighlightBuiltins=1
let vimclojure#HighlightContrib=1
let vimclojure#DynamicHighlighting=1
let vimclojure#ParenRainbow=1
let vimclojure#WantNailgun = 1
let vimclojure#NailgunClient = $HOME . "/.vim/lib/vimclojure-nailgun-client/ng"
let vimclojure#SplitSize = 10
let vimclojure#SplitPos = "bottom"

" }}}
" {{{ python-mode

let g:pymode_folding = 0

" }}}

" }}}

" antlr filetype {{{
augroup filetype_antlr
  autocmd!
  autocmd BufNewFile,BufRead *.g4 set ft=antlr
augroup END
" }}}

" Vimscript settings {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" YAML settings {{{
augroup filetype_yaml
  autocmd!
  autocmd FileType yaml setlocal foldmethod=indent
  autocmd FileType yaml setlocal tabstop=2
  autocmd FileType yaml setlocal softtabstop=2
  autocmd FileType yaml setlocal shiftwidth=2
augroup END
" }}}
