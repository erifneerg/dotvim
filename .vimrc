""""""""""""""
"pathogen setup
""""""""""""""
syntax on
set nocompatible
filetype off
"call pathogen#runtime_append_all_bundles()

set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'
"vim addon

"Colors
Bundle 'altercation/vim-colors-solarized'
Bundle 'nanotech/jellybeans.vim'
Bundle 'spwhitt/Smyck-Color-Scheme'

"Syntax
Bundle 'tpope/vim-haml'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'tpope/vim-markdown'

"interface
Bundle 'Lokaltog/vim-powerline'
Bundle 'spolu/dwm.vim'

"Search
Bundle 'kien/ctrlp.vim'

"tab
"Bundle 'ervandew/supertab'
"Bundle 'garbas/vim-snipmate'
"Bundle 'honza/snipmate-snippets'
Bundle 'SirVer/ultisnips'
"Bundle 'vim-scripts/AutoComplPop'

"
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'tomtom/tlib_vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-surround'
Bundle 'mikewest/vimroom'

filetype plugin indent on

"basic setup
"""""""""""""
"set to vim not vi
set wrap
set linebreak
set number
set ruler
set t_Co=256

set ttymouse=xterm2
set mouse=n

"said to help with osx clipboard fun stuff
if $TMUX == ''
  set clipboard+=unnamed
endif

"""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""

" OS picking
"""""""""""""""""
if has('macunix')
  set guifont=DejaVu\ Sans\ Mono:h18
elseif has('unix')
  set guifont=DejaVu\ Sans\ Mono:h18
elseif has('win32')
  set guifont=Courier\ New:h18
endif

"colorscheme smyck
colorscheme jellybeans
"" Solarize
"""""""""""""""
"let g:solarized_termcolors=256
"colorscheme solarized
"set background=light
""call togglebg#map("") 
"
"if has('gui_running')
"    set guioptions=egmrt
""else
""    set background=dark
"endif


"snipMate setup because of pathegen
""""""""""""""
let g:snippets_dir = "~/.vim/bundle/snippets/snippets/"
"let g:snippets_dir = "~/.vim/snippets"


""""""""""""""
"Powerline
""""""""""""""
set laststatus=2   " Always show the statusline
"let g:Powerline_symbols = 'unicode'
"let Powerline_symbols = 'unicode'

"""""""""""""""""
"side boarders
"""""""""""""""""
set foldcolumn=0

"if exists('+colorcolumn')
"  set colorcolumn=80
"else
"  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
"endif

"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

"""""""""""""""""
" Saving stuff
"""""""""""""""""

"set lang
try
    lang en_US
catch
endtry

"Default file types
set ffs=unix,dos,mac

" Set encoding
set encoding=utf-8

""""""""""""""
" Whitespace
""""""""""""""

set list listchars=tab:\ \ ,trail:·
"recommend by drupal.org
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
"set display+=lastline

""""""""""""""""""
" Searching
"""""""""""""""""""
set hlsearch
set incsearch
set ignorecase
set smartcase

"""""""""""""""""
" Tab completion
"""""""""""""""""
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,.DS_Store,*/.sass-cache/*,.swp,

"" Disable Arrows
"inoremap  <Up>     <NOP>
"inoremap  <Down>   <NOP>
"inoremap  <Left>   <NOP>
"inoremap  <Right>  <NOP>
"noremap   <Up>     <NOP>
"noremap   <Down>   <NOP>
"noremap   <Left>   <NOP>
"noremap   <Right>  <NOP>

"""""""""""""""""""""""""""""""""""""""""
" Drupal module/etc syntax highlighting
"""""""""""""""""""""""""""""""""""""""""

if has("autocmd")
  " Drupal *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
  augroup END
endif


au BufRead,BufNewFile *.scss set filetype=scss

"ctrlP
"
let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|\.sass-cache$\'

""""""""""""
"short cuts
""""""""""""

"ab rwhites %s/\s\+$//e

"""""""""""""""""
"markdown convert
"""""""""""""""""

ab m2h :%! /usr/local/bin/Markdown.pl --html4tags <cr>

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

set nolist
