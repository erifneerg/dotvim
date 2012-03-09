"it's 20XX no vi please
set nocompatible
"said to help with osx clipboard fun stuff
set clipboard=unnamed
"Enable syntax hl
syntax enable
set wrap
set linebreak
set number
set ruler
set t_Co=256

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set guifont=Inconsolata\ Medium\ 18
"set guifont=Anonymous\ Pro:h18
"set guifont=Consolas\ for\ BBEdit:h18
"set guifont=Andale\ Mono:h14
"set guifont=Courier\ New:h19

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OS picking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('macunix')
  set guifont=Inconsolata:h18
elseif has('unix')
  set guifont=Inconsolata\ Medium\ 18
elseif has('win32')
  set guifont=Courier\ New:h19
endif

if &t_Co == 256
  let g:solarized_termcolors=256
endif

if has('gui_running')
    set background=light
    colorscheme solarized
    set guioptions=egmrt
else
    set background=dark
endif

ab bl set background=light
ab bd set background=dark

"call togglebg#map("<F5>")

"""""""""""""""""
"side boarders
"""""""""""""""""
set foldcolumn=3

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Whitespace stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set nowrap
set list listchars=tab:\ \ ,trail:·
"recommend by drupal.org
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent

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

" Disable Arrows
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

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



""""""""""""""""""""""""""
" NERDTree configuration
""""""""""""""""""""""""""
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
map <Leader>[ :NERDTreeToggle<CR>

" ZoomWin configuration
"map <Leader><Leader> :ZoomWin<CR>

""""""""""""
" Snipmate
"""""""""""
:filetype plugin on

au BufRead,BufNewFile *.scss set filetype=scss

""""""""""""""""
"pathogen setup
""""""""""""""""
call pathogen#infect()

""""""""""""""""
"VimRoom setup
""""""""""""""""
g:vimroom_navigational_keys 
g:vimroom_background black
ab vr bd<CR>:VimroomToggle<CR>
"se nonu<CR>:

""""""""""""
"short cuts
""""""""""""

"ab rwhites %s/\s\+$//e

"""""""""""""""""
"markdown convert
"""""""""""""""""

ab m2h :%! /usr/local/bin/Markdown.pl --html4tags <cr>
