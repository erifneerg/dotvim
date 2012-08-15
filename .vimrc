""""""""""""""
"pathogen setup
""""""""""""""
syntax on
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

"basic setup
"""""""""""""
"set to vim not vi
set nocompatible
"said to help with osx clipboard fun stuff
set clipboard=unnamed
set wrap
set linebreak
set number
set ruler
set t_Co=256
set noswapfile"disables swap files

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

"" Solarize
"""""""""""""""
"let g:solarized_termcolors=256
"colorscheme solarized
"set background=light
"call togglebg#map("") 
"
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

" Special Character
set list listchars=tab:\ \ ,trail:·,eol:¬,precedes:%

"recommend by drupal.org
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
"set display+=lastline

"Indent Guide
"
"let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
set ts=2 sw=3 et
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
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

"" Disable Arrows
"inoremap  <Up>     <NOP>
"inoremap  <Down>   <NOP>
"inoremap  <Left>   <NOP>
"inoremap  <Right>  <NOP>
"noremap   <Up>     <NOP>
"noremap   <Down>   <NOP>
"noremap   <Left>   <NOP>
"noremap   <Right>  <NOP>

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

" SASS syntax
"""""""""""""


" SCSS syntax highlight
"au BufRead,BufNewFile *.scss set filetype=scss



" Snipmate
"""""""""""
:filetype plugin on

"ctrlP
"""""""""""""
let g:ctrlp_working_path_mode = 'rc'


"short cuts
""""""""""""

"ab rwhites %s/\s\+$//e


"markdown convert
"""""""""""""""""

ab m2h :%! /usr/local/bin/Markdown.pl --html4tags <cr>

set nolist
