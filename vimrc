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
Bundle 'tomelm/Smyck-Color-Scheme'
Bundle 'Lokaltog/vim-distinguished'
Bundle 'vim-scripts/twilight256.vim'  
Bundle 'tpope/vim-vividchalk'
Bundle 'sickill/vim-monokai'
Bundle 'nelstrom/vim-mac-classic-theme'

"Syntax
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
"Bundle 'ap/vim-css-color'
Bundle 'othree/html5.vim'
Bundle 'technosophos/drupal-snippets'
"Bundle 'cakebaker/scss-syntax.vim'
"Bundle 'plasticboy/vim-markdown'

"interface
Bundle 'Lokaltog/vim-powerline'
Bundle 'majutsushi/tagbar'
Bundle 'nathanaelkane/vim-indent-guides'
"Bundle 'scrooloose/nerdtree'

"Search
Bundle 'kien/ctrlp.vim'

"Auto typing
Bundle 'garbas/vim-snipmate'
Bundle 'honza/snipmate-snippets'
"Bundle 'AutoComplPop'
Bundle 'tpope/vim-surround'
"Bundle 'Townk/vim-autoclose'
"Bundle 'SirVer/ultisnips'
"Movement
Bundle 'tpope/vim-unimpaired'
"Search
Bundle 'mileszs/ack.vim'
"error checking
Bundle 'scrooloose/syntastic'
"vim addon
""""""""""
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'

"Git
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'

filetype plugin indent on

let g:netrw_home=$HOME . '/.hide'

"mose movement test
set ttymouse=xterm2
set mouse=a

"basic setup
"""""""""""""
set wrap
set linebreak
set t_Co=256
set relativenumber
set list

"Break the habit
""""""""""""""""
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
 
" Colors and Fonts
""""""""""""""""""
"colorscheme twilight256
"colorscheme smyck
colorscheme smyck256
"colorscheme jellybeans 
"colorscheme monokai

"let g:solarized_termcolors=256
"colorscheme solarized
"set background=dark

"Light colorscheme
"colorscheme mac_classic

"Current Line highlighting
""""""""""""""""""""""""""
"set cursorline
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

function! ToggleNuMode()
  if(&rnu == 1)
    set nu
  else
    set rnu
  endif
endfunc
nnoremap <Leader>n :call ToggleNuMode()<CR>

"Quick working path change
""""""""""""""""""""""""""
cnoremap %% <C-R>=expand('%:h').'/'<Cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Whitespace
""""""""""""
"set list listchars=tab:\ \ ,trail:·

" help with osx clipboard fun stuff
if $TMUX == ''
  set clipboard+=unnamed
endif
    
"recommend by drupal.org
set expandtab
set tabstop=2
set shiftwidth=2
"set display+=lastline


" Saving stuff
""""""""""""""
set ffs=unix,dos,mac " Default file types
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
let g:ctrlp_working_path_mode =0
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|\.sass-cache$\'

"search clear
nnoremap <F3> :set hlsearch!<CR>

" Return a corresponding paren to be sent to the buffer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CloseParen()
    let parenpairs = {'(' : ')',
                   \  '[' : ']',
                   \  '{' : '}'}

    let [m_lnum, m_col] = searchpairpos('[[({]', '', '[\])}]', 'nbW')

    if (m_lnum != 0) && (m_col != 0)
        let c = getline(m_lnum)[m_col - 1]
        return parenpairs[c]
    endif
    return ''
endfun
imap <C-e> <C-r>=CloseParen()<CR>

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
