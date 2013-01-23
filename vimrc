set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'tpope/vim-sensible'
"Colors
Bundle 'altercation/vim-colors-solarized'
Bundle 'noahfrederick/Hemisu' 
Bundle 'nanotech/jellybeans.vim'
Bundle 'spwhitt/Smyck-Color-Scheme'
Bundle 'Lokaltog/vim-distinguished'
Bundle 'vim-scripts/twilight256.vim'  
"Bundle 'godlygeek/csapprox'

"Syntax
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'othree/html5.vim'
Bundle 'technosophos/drupal-snippets'
Bundle 'cakebaker/scss-syntax.vim'

"interface
Bundle 'Lokaltog/vim-powerline'
Bundle 'majutsushi/tagbar'

"Search
Bundle 'kien/ctrlp.vim'
"and 'burke/matcher'

"Movement
Bundle 'garbas/vim-snipmate'
Bundle 'lammerman/AutoComplPop'
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

Bundle 'spolu/dwm.vim'

filetype plugin indent on

"mose movement test
set ttymouse=xterm2
set mouse=a

"basic setup
"""""""""""""
set wrap
set linebreak
set t_Co=256
set relativenumber

" Colors and Fonts
""""""""""""""""""
"colorscheme twilight256
colorscheme smyck
"colorscheme jellybeans 
"set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized

"Current Line highlighting
"set cursorline
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

"Keep Highligh only in current window
"augroup CursorLine
"  au!
"  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
"  au WinLeave * setlocal nocursorline
"augroup END


function! ToggleNuMode() 
  if(&rnu == 1) 
    set nu 
  else 
    set rnu 
  endif 
endfunc 
nnoremap <Leader>n :call ToggleNuMode()<CR>

" Whitespace
""""""""""""
"set list listchars=tab:\ \ ,trail:·

" said to help with osx clipboard fun stuff
set clipboard+=unnamed

"recommend by drupal.org
set expandtab
set tabstop=2
set shiftwidth=2
"set display+=lastline


" Saving stuff
""""""""""""""
set ffs=unix,dos,mac " Default file types
au FocusLost * :wa   " Save when focus lost
"set lang
try
    lang en_US
catch
endtry

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

" SASS and Compass setup
""""""""""""""""""""""""
au BufRead,BufNewFile *.scss set filetype=scss

"ctrlP
""""""
let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|\.sass-cache$\'


"short cuts
"""""""""""
ab m2h :%! /usr/local/bin/Markdown.pl --html4tags <cr> "markdown convert

" For writing my words
""""""""""""""""""""""
func! WordProcessorMode() 
  setlocal formatoptions=1 
  setlocal noexpandtab 
  set norelativenumber 
  map j gj 
  map k gk
  setlocal spell spelllang=en_us 
  set complete+=s
  set formatprg=par
  setlocal wrap 
  setlocal linebreak 
endfu 
com! WP call WordProcessorMode()

func! DropBoxNoteSetup()
  "set working path
  "set to WP
  "new files
  "set syntax to markdown
endfu
com! NOTE call DropBoxNoteSetup()

func! DevMode() 
  unmap j
  unmap k
  set ruler
  set relativenumber
endfu
com! DEV call DevMode()

"reload vimrc
augroup vimrcs
  au!
  au bufwritepost ~/.vimrc 
    \ source ~/.vimrc |
    \ if exists('g:Powerline_loaded') |
      \ silent! call Pl#Load() |
    \ endif 
augroup END

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! %!sudo tee > /dev/null %

set nolist
