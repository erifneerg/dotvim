syntax on
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

Bundle 'gmarik/vundle'

"Colors
Bundle 'altercation/vim-colors-solarized'
Bundle 'noahfrederick/Hemisu' 
Bundle 'nanotech/jellybeans.vim'
Bundle 'spwhitt/Smyck-Color-Scheme'
"Bundle 'amdt/sunset' 

"Syntax
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'othree/html5.vim'
Bundle 'technosophos/drupal-snippets'
Bundle 'cakebaker/scss-syntax.vim'

"interface
Bundle 'Lokaltog/vim-powerline'
"Bundle 'spolu/dwm.vim'

"Search
Bundle 'kien/ctrlp.vim'

"Movement
Bundle 'garbas/vim-snipmate'
Bundle 'lammermann/AutoComplPop'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-surround'
Bundle 'nathanaelkane/vim-indent-guides'

"vim addon
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/snipmate-snippets'

"Git
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'


filetype on
filetype plugin indent on

"basic setup
"""""""""""""
"set to vim not vi
set wrap
set linebreak
set number
set ruler
set t_Co=256
set relativenumber
set undofile

"set ttymouse=xterm2
"set mouse=n

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

colorscheme smyck
"colorscheme jellybeans
"colorscheme hemisu 
"" Solarize
"""""""""""""""
"let g:solarized_termcolors=256
"colorscheme solarized
"set background=light
"
"if has('gui_running')
"    set guioptions=egmrt
""else
""    set background=dark
"endif

"Powerline
""""""""""""""
set laststatus=2   " Always show the statusline
"let g:Powerline_symbols = 'unicode'
"let Powerline_symbols = 'unicode'

"side boarders
""""""""""""""
set foldcolumn=0

" Saving stuff
""""""""""""""
set ffs=unix,dos,mac " Default file types
set encoding=utf-8   " Set encoding
au FocusLost * :wa   " Save when focus lost
"set lang
try
    lang en_US
catch
endtry

" Whitespace
""""""""""""
set list listchars=tab:\ \ ,trail:·

"recommend by drupal.org
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
"set display+=lastline

" Searching
"""""""""""
set hlsearch
set incsearch
set ignorecase
set smartcase
nnoremap <F3> :noh<cr>

" Tab completion
"""""""""""""""""
nnoremap <tab> %
vnoremap <tab> %

" Drupal module/etc syntax highlighting
"""""""""""""""""""""""""""""""""""""""
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
""""""
let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|\.sass-cache$\'

"short cuts
"""""""""""
ab m2h :%! /usr/local/bin/Markdown.pl --html4tags <cr> "markdown convert

"autocomplte
""""""""""""
inoremap <leader>, <C-x><C-o>
inoremap <leader>: <C-x><C-f>
inoremap <leader>= <C-x><C-l>

set ofu=syntaxcomplete#Complete
"set omnifunc=csscomplete#CompleteCSS

set completeopt=menuone

func! WordProcessorMode() 
  setlocal formatoptions=1 
  setlocal noexpandtab 
  map j gj 
  map k gk
  setlocal spell spelllang=en_us 
  set thesaurus+=/Users/sbrown/.vim/thesaurus/mthesaur.txt
  set complete+=s
  set formatprg=par
  setlocal wrap 
  setlocal linebreak 
endfu 
com! WP call WordProcessorMode()

"reload vimrc
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! %!sudo tee > /dev/null %

set nolist
