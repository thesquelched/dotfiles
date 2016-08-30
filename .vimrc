set nocp

call pathogen#infect()
call pathogen#helptags()

syntax on
filetype plugin indent on
syntax sync minlines=256


" Appearance {{{

set background=dark

if has('gui_running')
  highlight SignColumn guibg=black

  if has("unix")
      let s:uname = system("uname -s")
      if s:uname == "Linux\n"
        set guifont=Inconsolata\ Medium\ 8
      endif
  endif
else
  let g:solarized_termcolors=256
endif

colorscheme solarized

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

" Undo/Backup/Swap files {{{

" Save your backups to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or . if all else fails.
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

" }}}

" }}}


" Bindings {{{

" Leaders
let mapleader = ","
let maplocalleader = "\\"

" Insert Mode bindings {{{

" }}}

" Normal Mode bindings {{{

" PymodeLint
nnoremap <Leader>l :PymodeLint<CR>

" Save and next buffer
nnoremap <Leader>bn :w<CR>:bn<CR>

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

" {{{ Python bindings

" Convert `key=value` to `'key': value`, e.g.
"
"   foo=1,
"   bar=2
"
" becomes...
"
"   'foo': 1,
"   'bar': 2

vnoremap <leader>d :norm ^yst='f=c1l: <CR>
vnoremap <leader>D :norm ^ds'f:c2l=<CR>

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

" Use 100-character lines for internal code, use 80 for personal code
function! SetPymodeOptions(width)
    let l:tw = a:width-2
    let g:pymode_options_max_line_length = a:width
    let &textwidth = l:tw
endfunction

"function! SetPymodePy3k()
"    let g:pymode_python = "python3"
"    source ~/.vim/bundle/python-mode/plugin/pymode.vim
"endfunction

let g:pymode_options_max_line_length = 100
autocmd BufRead,BufNewFile */git/personal/* call SetPymodeOptions(80)

let g:pymode_lint_ignore = "W0401"
let g:pymode_folding = 0
let g:pymode_rope_completion = 0
let g:pymode_rope = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_lint_options_pylint =
    \ {'rcfile': './pylint.conf'}

"let g:pymode_rope_lookup_project = 0
"let g:pymode_rope_autoimport = 0

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

" Misc Settings {{{
autocmd filetype crontab setlocal nobackup nowritebackup
" }}}
